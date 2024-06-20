resource "datadog_monitor" "pipeline_committers" {
  name    = "[CI Visibility] Number of pipeline committers"
  type    = "metric alert"
  message = "Nb of pipeline committers is too high!"
  query   = "max(last_10m):max:datadog.estimated_usage.ci_visibility.pipeline.committers{*}  > ${var.commited_ci_visibility_pipeline_committers}"
  tags    = var.monitors_tags
}

resource "datadog_monitor" "test_committers" {
  name    = "[CI Visibility] Number of test committers"
  type    = "metric alert"
  message = "Nb of test committers is too high!"
  query   = "max(last_10m):max:datadog.estimated_usage.ci_visibility.test.committers{*}  > ${var.commited_ci_visibility_test_committers}"
  tags    = var.monitors_tags
}