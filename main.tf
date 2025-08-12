terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#_____REGION_____
provider "aws" {
  region = "eu-west-2"
}


#_____Change in "variables.tf" file_____
resource "aws_ssm_parameter" "feature_flag" {
  name  = var.parameter_name
  type  = "String"
  value = var.parameter_value
}
