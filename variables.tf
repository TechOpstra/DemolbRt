# variables.tf

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "aws_version" {
  description = "The version of the AWS provider"
  type        = string
  default     = "~> 5.87.0"
}


variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_az1_cidr" {
  description = "The CIDR block for the public subnet in AZ1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_az2_cidr" {
  description = "The CIDR block for the public subnet in AZ2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_az3_cidr" {
  description = "The CIDR block for the public subnet in AZ3"
  type        = string
  default     = "10.0.3.0/24"
}

variable "availability_zone_1" {
  description = "The first availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "The second availability zone"
  type        = string
  default     = "us-east-1b"
}

variable "availability_zone_3" {
  description = "The third availability zone"
  type        = string
  default     = "us-east-1c"
}

variable "instance_type" {     
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the instances"
  type        = string
  default     = "ami-04b4f1a9cf54c11d0"  # Example AMI ID, replace with your own
}
  
