resource "datadog_monitor" "host_count" {
  name    = "[Infra] Number of hosts"
  type    = "metric alert"
  message = "Nb of hosts is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.hosts{*}  > ${var.commited_hosts}"
  tags    = var.monitors_tags
}

resource "datadog_monitor" "container_count" {
  name    = "[Infra] Number of containers"
  type    = "metric alert"
  message = "Nb of containers is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.containers{*}  > ${var.commited_hosts * local.included_containers}"
  tags    = var.monitors_tags
}

resource "datadog_monitor" "custom_metrics" {
  name    = "[Infra] Number of custom metrics"
  type    = "metric alert"
  message = "Nb of custom metrics is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.metrics.custom{*}  > ${var.commited_hosts * local.included_metrics}"
  tags    = var.monitors_tags
}

resource "datadog_monitor" "custom_events" {
  name    = "[Infra] Number of custom events"
  type    = "metric alert"
  message = "Nb of custom events is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.events.custom_events{*}  > ${var.commited_hosts * local.included_events}"
  tags    = var.monitors_tags
}
