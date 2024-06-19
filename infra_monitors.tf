resource "datadog_monitor" "host_count" {
  name    = "Number of hosts"
  type    = "metric alert"
  message = "Nb of hosts is too high!"
  query   = "max(last_10m):max:datadog.estimated_usage.hosts{*}  > ${var.commited_hosts}"
  tags    = ["service:datadog_usage"]
}

resource "datadog_monitor" "container_count" {
  name    = "Number of containers"
  type    = "metric alert"
  message = "Nb of containers is too high!"
  query   = "max(last_10m):max:datadog.estimated_usage.containers{*}  > ${var.commited_hosts * local.included_containers}"
  tags    = ["service:datadog_usage"]
}

resource "datadog_monitor" "custom_metrics" {
  name    = "Number of custom metrics"
  type    = "metric alert"
  message = "Nb of custom metrics is too high!"
  query   = "max(last_10m):max:datadog.estimated_usage.metrics.custom{*}  > ${var.commited_hosts * local.included_metrics}"
  tags    = ["service:datadog_usage"]
}

resource "datadog_monitor" "custom_events" {
  name    = "Number of custom events"
  type    = "metric alert"
  message = "Nb of custom events is too high!"
  query   = "max(last_10m):max:datadog.estimated_usage.events.custom_events{*}  > ${var.commited_hosts * local.included_events}"
  tags    = ["service:datadog_usage"]
}
