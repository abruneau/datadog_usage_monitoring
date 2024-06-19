resource "datadog_monitor" "asm_sca_hosts_count" {
  name    = "[Security] Number of ASM SCA hosts"
  type    = "metric alert"
  message = "Nb of hosts is too high!"
  query   = "max(last_10m):max:datadog.estimated_usage.asm.vulnerability_oss_host{*}  > ${var.commited_asm_sca_hosts}"
  tags    = ["service:datadog_usage"]
}