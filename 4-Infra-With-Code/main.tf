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
}

# After writing terrafrom and provider block we do terraform init command,  
# for downloading all requirement files.   

