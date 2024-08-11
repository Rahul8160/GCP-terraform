variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range of the Subnet"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}
