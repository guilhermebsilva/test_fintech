provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source          = "./modules/ec2"
  vpc_id          = module.vpc.vpc_id
  public_subnet   = module.vpc.public_subnet_ids[0]
  instance_type   = "t2.micro"
  key_name        = "test-fintech" 
}

module "cloudfront" {
  source         = "./modules/cloudfront"
  origin_domain  = module.ec2.instance_public_dns
}

