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
sudo zypper in -y python
sudo zypper install -y python2-pip
sudo pip2 install ansible
git clone https://abhirup92:79a464f5b271b644083b2e6ee9f579e9b9dd1794@github.com/abhirup92/adp-mkpl-test-ABHIRUP.git
cd adp-mkpl-test-ABHIRUP/
ansible-playbook node-npm-install.yml
EOF
}

resource "aws_s3_bucket" "example" {
  bucket = "abhirup-test-first"
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "example1" {
  bucket = "${aws_s3_bucket.example.id}"

  block_public_acls   = true
  block_public_policy = true
}

