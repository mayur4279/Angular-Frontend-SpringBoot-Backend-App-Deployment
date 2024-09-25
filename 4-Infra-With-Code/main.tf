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
  region = "us-east-1"
  access_key = var.access_key 
  secret_key = var.secret_access_key
}

# After writing terrafrom and provider block we do terraform init command,  
# for downloading all requirement files.   


module "vpc_creating" {
    source = "./modules/vpc"
    vpc_cidr_block = "10.0.0.0/16"  
    availability_zone-1 = "us-east-1a" 
    availability_zone-1_cidr = "10.0.1.0/24" 
    availability_zone-2 = "us-east-1b"   
    availability_zone-2_cidr = "10.0.2.0/24"
    route_table_cidr = "0.0.0.0/0"  
}


module "ec2_instance_creating" {
  source = "./modules/aws_instance"
  security_group_cidr_range = "0.0.0.0/0"   
  ami_id = "ami-0ebfd941bbafe70c6"   
  instance_type = "t2.medium"   
}



