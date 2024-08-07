resource "datadog_monitor" "dbm_host_count" {
  name    = "[DBM] Number of DBM hosts"
  type    = "metric alert"
  message = "Nb of hosts is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.dbm.hosts{*}  > ${var.commited_dbm_hosts}"
  tags    = var.monitors_tags
}