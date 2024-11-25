ariable "project_name" {
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
