resource "datadog_monitor" "logs_ingested_month" {
  name    = "[Log] Monthly number of log ingested"
  type    = "metric alert"
  message = "Nb of log ingested is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.logs.ingested_bytes{*}.as_count()  > ${var.commited_ingested_logs * local.gb_to_b}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "logs_indexed_month" {
  name    = "[Log] Monthly number of logs indexed"
  type    = "metric alert"
  message = "Nb of logs indexed is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.logs.ingested_events{datadog_is_excluded:false}.as_count()  > ${var.commited_indexed_logs * local.million}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "logs_ingested_day" {
  name    = "[Log] Daily number of log ingested"
  type    = "metric alert"
  message = "Nb of log ingested is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.logs.ingested_bytes{*}.as_count()  > ${var.commited_ingested_logs * local.gb_to_b / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "logs_indexed_day" {
  name    = "[Log] Daily number of logs indexed"
  type    = "metric alert"
  message = "Nb of logs indexed is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.logs.ingested_events{datadog_is_excluded:false}.as_count()  > ${var.commited_indexed_logs * local.million / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "logs_sds_month" {
  name    = "[Log] Monthly number of log scanned with SDS"
  type    = "metric alert"
  message = "Nb of log scaned is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.sds.scanned_bytes{*}.as_count()  > ${var.commited_sds_logs * local.gb_to_b}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "logs_sds_day" {
  name    = "[Log] Daily number of log scanned with SDS"
  type    = "metric alert"
  message = "Nb of log scaned is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.sds.scanned_bytes{*}.as_count()  > ${var.commited_sds_logs * local.gb_to_b / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}