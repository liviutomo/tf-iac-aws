# core

variable "region" {
  description = "The AWS region to create resources in."
  default     = "eu-north-1"
}

# networking

variable "public_subnet_1_cidr" {
  description = "CIDR Block for Public Subnet 1"
  default     = "10.0.1.0/24"
}
variable "public_subnet_2_cidr" {
  description = "CIDR Block for Public Subnet 2"
  default     = "10.0.2.0/24"
}
variable "private_subnet_1_cidr" {
  description = "CIDR Block for Private Subnet 1"
  default     = "10.0.3.0/24"
}
variable "private_subnet_2_cidr" {
  description = "CIDR Block for Private Subnet 2"
  default     = "10.0.4.0/24"
}
variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-north-1b", "eu-north-1c"]
}

# load balancer

variable "health_check_path" {
  description = "Health check path for the default target group"
  default     = "/ping/"
}

# ecs

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "production"
}

# logs

variable "log_retention_in_days" {
  default = 30
}

variable "docker_image_url_django" {
  description = "Docker image to run in the ECS cluster"
  default     = "891377058700.dkr.ecr.eu-north-1.amazonaws.com/django-app:latest"
}

variable "app_count" {
  description = "Number of Docker containers to run"
  default     = 2
}

variable "fargate_cpu" {
  description = "Amount of CPU for Fargate task. E.g., '256' (.25 vCPU)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Amount of memory for Fargate task. E.g., '512' (0.5GB)"
  default     = "512"
}

# ECS service auto scaling

variable "autoscale_min" {
  description = "Minimum autoscale (number of tasks)"
  default     = "1"
}

variable "autoscale_max" {
  description = "Maximum autoscale (number of tasks)"
  default     = "10"
}

variable "autoscale_desired" {
  description = "Desired number of tasks to run initially"
  default     = "4"
}

# rds

variable "rds_db_name" {
  description = "RDS database name"
  default     = "mydb"
}
variable "rds_username" {
  description = "RDS database username"
  default     = "foo"
}
variable "rds_password" {
  description = "RDS database password"
}
variable "rds_instance_class" {
  description = "RDS instance type"
  default     = "db.t3.micro"
}

# domain

variable "certificate_arn" {
  description = "AWS Certificate Manager ARN for validated domain"
  default     = "arn:aws:acm:eu-north-1:891377058700:certificate/f6d9b0be-c038-4fa2-8d74-1f7e5721eee2"
}