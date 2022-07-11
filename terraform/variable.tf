variable "region" {
  description = "aws region"
  default     = "us-east-1"
}

variable "account_id" {
  default = 127012818163
}

variable "prefix" {
  description = "objects prefix"
  default     = "vector"
}

# Prefix configuration and project common tags
locals {
  glue_bucket = "${var.prefix}-${var.bucket_names[4]}-${var.account_id}"
  prefix      = var.prefix
  common_tags = {
    Project = "example-tag"
  }
}

variable "bucket_names" {
  description = "s3 bucket names"
  type        = list(string)
  default = [
    "landing",
    "bronze",
    "silver",
    "gold",
    "aws-glue-scripts"
  ]
}

variable "glue_job_role_arn" {
  description = "The ARN of the IAM role associated with this job."
  default     = null
}