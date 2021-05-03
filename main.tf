provider "aws" {
  region     = "us-east-2"
  access_key = "AKIA3J5UIB3Q5PJWAHQA"
  secret_key = "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"
}


resource "aws_vpc" "MyVpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "VPC-1"
    }
}

resource "aws_subnet" "MySubnet" {
    vpc_id = aws_vpc.MyVpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-2a"

}

data "aws_vpc" "existing_vpc"{
    default = true
}

resource "aws_subnet" "MySubnet1" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.48.0/20"
    availability_zone = "us-east-2a"
  
}


output "vpc_id" {
  value = aws_vpc.MyVpc.id
  
}

output "subnet_id" {
  value = aws_subnet.MySubnet.id
  #value = aws_subnet.MySubnet.cidr_block
}

output "vpc_ipv6_association_id" {
  value = aws_vpc.MyVpc.ipv6_association_id
  #value = aws_vpc.MyVpc.ipv6_association_id
}