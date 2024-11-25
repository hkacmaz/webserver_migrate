variable "project_name" {
  description = "webservice infra migration to aws"
  type        = string
  default     = "my_project"
}

variable "region" {
  description = "Frankfurt central eu"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "key_pair_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
}

variable "availability_zones" {
  description = "List of Availability Zones"
  type        = list(string)
}

variable "route53_zone_id" {
  description = "ID of the Route 53 hosted zone"
  type        = string
}

variable "record_name" {
  description = "Name of the DNS record"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
  type        = string
  default     = "ami-0d52a4bd932508da0"
}

variable "instance_type" {
  description = "Type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}
