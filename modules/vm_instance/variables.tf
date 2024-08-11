variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "image" {
  description = "Image to use for the VM"
  type        = string
}

variable "network" {
  description = "VPC Network to attach to"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork to attach to"
  type        = string
}
