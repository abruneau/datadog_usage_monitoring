resource "datadog_monitor" "npm_count" {
  name    = "[Network] Number of NPM hosts"
  type    = "metric alert"
  message = "Nb of hosts is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.network.hosts{*}  > ${var.commited_network_hosts}"
  tags    = var.monitors_tags
}

resource "datadog_monitor" "ndm_count" {
  name    = "[Network] Number of NDM devices"
  type    = "metric alert"
  message = "Nb of devices is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.network.devices{*}  > ${var.commited_network_devices}"
  tags    = var.monitors_tags
}