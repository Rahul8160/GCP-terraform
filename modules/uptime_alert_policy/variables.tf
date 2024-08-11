variable "uptime_check_name" {
  description = "Name of the uptime check"
  type        = string
}

variable "alert_policy_name" {
  description = "Name of the alert policy"
  type        = string
}

variable "instance_id" {
  description = "ID of the instance to monitor"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "notification_channel" {
  description = "Notification channel ID for alerts"
  type        = string
}
