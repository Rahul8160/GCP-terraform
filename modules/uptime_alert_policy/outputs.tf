output "uptime_check_id" {
  value = google_monitoring_uptime_check_config.uptime_check.id
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.alert_policy.id
}
