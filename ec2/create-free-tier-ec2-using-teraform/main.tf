# Define the default subnet in the specified availability zone.
resource "aws_default_subnet" "default" {
  availability_zone = "${var.aws_region}a"  # Set the availability zone (e.g., replace "a" with the desired zone)
}

# Create a default security group associated with the default subnet's VPC.
resource "aws_default_security_group" "default" {
  vpc_id = aws_default_subnet.default.vpc_id
}

# Generate a TLS private key for secure communication.
resource "tls_private_key" "example_key" {
  algorithm = "RSA"
}

# Create an AWS key pair using the generated TLS private key.
resource "aws_key_pair" "example_key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.example_key.public_key_openssh
}

# Save the private key to a local file within the module's directory.
resource "local_file" "private_key_file" {
  content  = tls_private_key.example_key.private_key_pem
  filename = "${path.module}/${var.key_name}.pem"  # Adjust the path and file name as needed
}

# Launch an AWS EC2 instance using the specified AMI, instance type, key pair, security group, and subnet.
resource "aws_instance" "example_instance_myk" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_default_security_group.default.id]
  subnet_id              = aws_default_subnet.default.id
  tags                   = {
    Name = "server-1"
  }
}
