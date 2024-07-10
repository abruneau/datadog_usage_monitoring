resource "datadog_monitor" "synthetics_api_month" {
  name    = "[Synthetics] Monthly number of synthetics api tests run"
  type    = "metric alert"
  message = "Nb of synthetics api tests run is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.synthetics.api_test_runs{*}.as_count()  > ${var.commited_synthetics_api * 10000}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "synthetics_api_day" {
  name    = "[Synthetics] Daily number of synthetics api tests run"
  type    = "metric alert"
  message = "Nb of synthetics api tests run is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.synthetics.api_test_runs{*}.as_count()  > ${var.commited_synthetics_api * 10000 / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "synthetics_browser_month" {
  name    = "[Synthetics] Monthly number of synthetics browser tests run"
  type    = "metric alert"
  message = "Nb of synthetics browser tests run is too high!"
  query   = "sum(current_1mo):sum:datadog.estimated_usage.synthetics.browser_test_runs{*}.as_count()  > ${var.commited_synthetics_browser * 1000}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "synthetics_browser_day" {
  name    = "[Synthetics] Daily number of synthetics browser tests run"
  type    = "metric alert"
  message = "Nb of synthetics browser tests run is too high!"
  query   = "sum(current_1d):sum:datadog.estimated_usage.synthetics.browser_test_runs{*}.as_count()  > ${var.commited_synthetics_browser * 1000 / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "synthetics_mobile_month" {
  name    = "[Synthetics] Monthly number of synthetics mobile tests run"
  type    = "metric alert"
  message = "Nb of synthetics mobile tests run is too high!"
  query   = "sum(current_1mo):sum:synthetics.test_runs{check_type:mobile_app}.as_count()  > ${var.commited_synthetics_mobile * 100}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      month_starts = 1
      day_starts = "00:00"
    }
  }
}

resource "datadog_monitor" "synthetics_mobile_day" {
  name    = "[Synthetics] Daily number of synthetics mobile tests run"
  type    = "metric alert"
  message = "Nb of synthetics mobile tests run is too high!"
  query   = "sum(current_1d):sum:synthetics.test_runs{check_type:mobile_app}.as_count()  > ${var.commited_synthetics_mobile * 100 / 30}"
  tags    = var.monitors_tags
  scheduling_options {
    evaluation_window {
      day_starts = "00:00"
    }
  }
}