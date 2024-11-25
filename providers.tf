terraform {

	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 4.0"
		}
	}
}

provider "aws" {

	alias = "central_eu"
	region = "eu-central-1"
}
