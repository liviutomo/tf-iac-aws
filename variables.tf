variable "region" {
  description = "The AWS region to create resources in."
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Project name to use in resource names"
  default     = "django_web_app"
}

variable "availability_zones" {
  description = "Availability zones"
  default     = ["eu-north-1a", "eu-north-1c"]
}

variable "ecs_prod_backend_retention_days" {
  description = "Retention period for backend logs"
  default     = 30
}