provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}
 
resource "aws_instance" "basic_ec2" {
  ami               = ""  # Amazon Linux 2 AMI (ap-south-1)
  instance_type     = "t2.micro"
  key_name          = "windows-common"
  security_groups   = ["default"]
 
  tags = {
    Name = "Basic-EC2"
  }
}
 
