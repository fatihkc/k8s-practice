variable "region" {
  type        = string
  description = "AWS region in which to create the cluster."
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Environment name."
  default     = "dev"
}

variable "mysql-version" {
  type        = string
  description = "Version of MySQL to install."
  default     = "9.7.1" # 8.0.32
}
