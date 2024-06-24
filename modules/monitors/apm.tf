resource "datadog_monitor" "apm_host_count" {
  name    = "[APM] Number of APM hosts"
  type    = "metric alert"
  message = "Nb of hosts is too high!"
  query   = "max(last_10m):max:datadog.estimated_usage.apm_hosts{*}  > ${var.commited_apm_hosts}"
  tags    = var.monitors_tags
}

resource "datadog_monitor" "profiling_host_count" {
  name    = "[APM] Number of Profiling hosts"
  type    = "metric alert"
  message = "Nb of hosts is too high!"
  query   = "max(last_10m):max:datadog.estimated_usage.profiling.hosts{*}  > ${local.profiling_hosts_count}"
  tags    = var.monitors_tags
}

resource "datadog_monitor" "apm_ingested_spans_month" {
  name    = "[APM] Monthly number of APM ingested spans"
  type    = "metric alert"
  message = "Nb of APM ingested spans is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.apm.ingested_bytes{*}.as_count()  > ${local.allotment_ingested_spans}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "apm_indexed_spans_month" {
  name    = "[APM] Monthly number of APM indexed spans"
  type    = "metric alert"
  message = "Nb of APM indexed spans is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.apm.indexed_spans{*}.as_count()  > ${local.allotment_indexed_spans}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "apm_ingested_spans_day" {
  name    = "[APM] Daily number of APM ingested spans"
  type    = "metric alert"
  message = "Nb of APM ingested spans is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.apm.ingested_bytes{*}.as_count()  > ${local.allotment_ingested_spans / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "apm_indexed_spans_day" {
  name    = "[APM] Daily number of APM indexed spans"
  type    = "metric alert"
  message = "Nb of APM indexed spans is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.apm.indexed_spans{*}.as_count()  > ${local.allotment_indexed_spans / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}
