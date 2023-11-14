provider "aws" {
  region = "us-east-2"  # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # AWS Linux 2 AMI (free tier eligible)
  instance_type = "t2.micro"  # AWS free tier eligible instance type

  tags = {
    Name = "example-instance"
  }
}
