variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-08c40ec9ead489470" # Amazon Linux 2 AMI (Free Tier)
}

variable "vpc_id" {
  description = "The VPC ID where the EC2 instance will be launched"
  type        = string
}

variable "public_subnet" {
  description = "The public subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to access the instance"
  type        = string
  default     = null
}