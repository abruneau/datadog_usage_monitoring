resource "datadog_monitor" "op_ingested_month" {
  name    = "[OP] Monthly number of log ingested by Observability Pipeline"
  type    = "metric alert"
  message = "Nb of log ingested is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.observability_pipelines.ingested_bytes{*}.as_count()  > ${var.commited_op_ingested_logs * local.gb_to_b}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "op_ingested_day" {
  name    = "[OP] Daily number of log ingested by Observability Pipeline"
  type    = "metric alert"
  message = "Nb of log ingested is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.observability_pipelines.ingested_bytes{*}.as_count()  > ${var.commited_op_ingested_logs * local.gb_to_b / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}