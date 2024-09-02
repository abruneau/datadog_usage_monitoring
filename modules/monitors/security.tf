resource "datadog_monitor" "asm_sca_hosts_count" {
  name    = "[Security] Number of ASM SCA hosts"
  type    = "metric alert"
  message = "Nb of hosts is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.asm.vulnerability_oss_host{*}  > ${var.commited_asm_sca_hosts}"
  tags    = var.monitors_tags
}

resource "datadog_monitor" "asm_serverless_traced_invocations" {
  name    = "[Security] Number of ASM Serverless invocations"
  type    = "metric alert"
  message = "Nb of invocations analyzed with ASM is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.asm.traced_invocations{*}  > ${var.commited_serverless_asm_invocations}"
  tags    = var.monitors_tags
}

resource "datadog_monitor" "siem_analyzed_events" {
  name    = "[Security] Number of Cloud SIEM Security Events"
  type    = "metric alert"
  message = "Nb of security events analyzed with SIEM is too high!"
  query   = "max(last_10m):sum:datadog.estimated_usage.security_monitoring.analyzed_events{*}  > ${var.commited_siem_logs}"
  tags    = var.monitors_tags
}