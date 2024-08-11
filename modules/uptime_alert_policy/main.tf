resource "google_monitoring_uptime_check_config" "uptime_check" {
  display_name = var.uptime_check_name
  timeout      = "10s"
  period       = "60s"

  monitored_resource {
    type   = "gce_instance"
    labels = {
      instance_id = var.instance_id
      project_id  = var.project_id
    }
  }

  http_check {
    path = "/"
    port = 80
  }

  content_matchers {
    content = "Healthy"
  }
}

resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = var.alert_policy_name
   combiner     = "OR"

  conditions {
    display_name = "Uptime Check Failed"
    condition_threshold {
      filter          = "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" AND resource.type=\"gce_instance\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0
    }
  }

  notification_channels = [var.notification_channel]
}
