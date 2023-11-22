variable "aws_region" {
  description = "The AWS region where the EC2 instance will be launched."
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID for the EC2 instance. Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-09-19"
  default     = "ami-0287a05f0ef0e9d9a"  # Replace with your desired AMI ID
}
variable "key_name" {
  description = "The name of the key pair used for SSH access."
  default     = "my-ec2-key-terrform"  # Replace with your default key pair name
}

# variable "subnet_id" {
#   description = "The VPC Subnet ID to launch in"
#   type        = string
#   default     = aws_default_vpc.default.default_subnet_id
# }
