provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "example" {
  ami           = "ami-01a3959899e3dc7c6"
  instance_type = "t2.micro"
  security_groups = ["launch-wizard-3"]
key_name = "abhi"
user_data = <<-EOF
#!/bin/bash
sudo zypper install -y git 
git clone https://abhirup92:AbhirupBili1@github.com/abhirup92/adp-mkpl-test-ABHIRUP.git
EOF
}

