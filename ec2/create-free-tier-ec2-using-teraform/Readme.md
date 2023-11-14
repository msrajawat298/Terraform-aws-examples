To create a free-tier AWS EC2 instance using Terraform, you need to follow these general steps. Before you begin, make sure you have the following prerequisites:

1. **AWS Account:** Make sure you have an AWS account. If you don't have one, you can sign up for a free-tier account at [AWS Free Tier](https://aws.amazon.com/free/).

2. **Terraform Installed:** Install Terraform on your local machine. You can download it from the [official website](https://www.terraform.io/downloads.html).

3. **AWS CLI Installed:** Install the AWS Command Line Interface (CLI) on your local machine. You can download it from the [AWS CLI website](https://aws.amazon.com/cli/).

Here are the steps to create an EC2 instance using Terraform:

### Step 1: Configure AWS CLI

Make sure you configure your AWS CLI with the necessary credentials. You can run the following command and provide your AWS access key ID, secret access key, default region, and output format:

```bash
aws configure
```

### Step 2: Create a Terraform Configuration File

Create a new file, for example, `main.tf`, and add the following content:

```hcl
provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # AWS Linux 2 AMI (free tier eligible)
  instance_type = "t2.micro"  # AWS free tier eligible instance type

  tags = {
    Name = "example-instance"
  }
}
```

In the `provider` block, set the desired AWS region.

In the `resource "aws_instance"` block, specify the AMI (Amazon Machine Image) and instance type. The example uses a free-tier eligible AMI and instance type.

### Step 3: Initialize Terraform

Open a terminal in the directory where your `main.tf` file is located and run:

```bash
terraform init
```

This command initializes the working directory and downloads the necessary provider plugins.

### Step 4: Preview Changes

Run the following command to see what changes Terraform will make:

```bash
terraform plan
```

### Step 5: Apply Changes

If the plan looks good, apply the changes with:

```bash
terraform apply
```

Type "yes" when prompted to confirm.

### Step 6: Destroy Resources (Optional)

To destroy the created resources when you no longer need them, run:

```bash
terraform destroy
```

Type "yes" when prompted to confirm.

Remember to manage your resources responsibly, and be aware of any potential charges associated with AWS resources outside of the free tier limits.