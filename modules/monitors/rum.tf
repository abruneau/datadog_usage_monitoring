resource "datadog_monitor" "rum_session_replay" {
  name    = "[RUM] Monthly number of RUM session replay"
  type    = "metric alert"
  message = "Nb of RUM session replay is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.rum.sessions{sku:replay}.as_count()  > ${var.commited_rum_replay * 1000}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts   = "00:00"
    }
  }
}

resource "datadog_monitor" "rum_session_replay_day" {
  name    = "[RUM] Daily number of RUM session replay"
  type    = "metric alert"
  message = "Nb of RUM session replay is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.rum.sessions{sku:replay}.as_count()  > ${var.commited_rum_replay * 1000 / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "rum_session" {
  name    = "[RUM] Monthly number of RUM session"
  type    = "metric alert"
  message = "Nb of RUM session is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.rum.sessions{! sku:replay}.as_count()  > ${var.commited_rum_sessions * 1000}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts   = "00:00"
    }
  }
}

resource "datadog_monitor" "rum_session_day" {
  name    = "[RUM] Daily number of RUM session"
  type    = "metric alert"
  message = "Nb of RUM session is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.rum.sessions{! sku:replay}.as_count()  > ${var.commited_rum_sessions * 1000 / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}
