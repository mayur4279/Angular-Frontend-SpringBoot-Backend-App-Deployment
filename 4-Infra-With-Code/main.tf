# basically we are telling to terrform that we are using aws as a source

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuring the AWS like (region, access_keys, secret_access_keys)    
provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_access_key
}


module "vpc_creating" {
  source                   = "./modules/vpc"
  vpc_cidr_block           = "10.0.0.0/16"
  availability_zone-1      = "us-east-1a"
  availability_zone-1_cidr = "10.0.1.0/24"
  availability_zone-2      = "us-east-1b"
  availability_zone-2_cidr = "10.0.2.0/24"
  route_table_cidr         = "0.0.0.0/0"
}



module "security_group" {
  source           = "./modules/security_group"
  name             = "main_security_group"
  vpc_id           = module.vpc_creating.id
  ingress_ports    = [22, 80, 8080]
  egress_ports     = [0]
  ingress_protocol = "tcp"
  egress_protocol  = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
}



module "ec2_instance_creating" {
  source                 = "./modules/aws_instance"
  ami_id                 = "ami-0ebfd941bbafe70c6"
  instance_type          = "t2.medium"
  subnet_id              = module.vpc_creating.subnet_ids
  vpc_security_group_ids = [module.security_group.id]
}



module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"
  bucket = "mayurrandombucket4279"
  block_public_acls = false
  block_public_policy = false 
}



output "aws_instance_ip" {
  value= module.ec2_instance_creating.jenkins_server_ip
}


output "bucket" {
  value= module.s3-bucket.s3_bucket_website_endpoint
}


