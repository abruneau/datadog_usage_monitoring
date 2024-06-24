resource "datadog_dashboard" "ordered_dashboard" {
  title = "Cost/Usage overview"
  description = "created with Terraform by Datadog support team"
  widget {
    note_definition {
      content = "# Billing\n\nTo get started: [Account Management / Billing Doc](https://docs.datadoghq.com/account_management/billing)\n\nThis dashboard provides an overview of the different usage metrics for Datadog. These are usage metrics, not billing metrics, and they **do not correlate 100% to billing**. These should only be used as a proxy to identify trends.\n\nThose metrics can also be used to identify the biggest consumers with a selected tag.\n\n## Disclaimer\n\nAll the information provided here have been copied from the doc at a specific date and are here for indications. They are subject to changes, please refer to the link provided for official information."
      background_color = "purple"
      font_size = "14"
      text_align = "left"
      show_tick = false
      tick_pos = "50%"
      tick_edge = "left"
    }
    widget_layout {
      x = 0
      y = 0
      width = 5
      height = 5
    }
  }
  widget {
    note_definition {
      content = "## Usage\n\nUsage is reported into the platform on a daily basis.\n\n[Usage page](/billing/usage)\n\n## Multi-org usage\n\nIn the [Usage page](/billing/usage), click on \"Individual Organizations\" tab to get a list of usage per sub-organization."
      background_color = "purple"
      font_size = "14"
      text_align = "left"
      show_tick = false
      tick_pos = "50%"
      tick_edge = "left"
    }
    widget_layout {
      x = 5
      y = 0
      width = 3
      height = 5
    }
  }
  widget {
    image_definition {
      url = "https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_white.png?auto=format&fit=max&w=847"
      sizing = "zoom"
    }
    widget_layout {
      x = 8
      y = 0
      width = 4
      height = 5
    }
  }
  widget {
    group_definition {
      title = "Infrastructure"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "Number of hosts running"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.hosts{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            formula {
              formula_expression = "month_before(query0)"
            }
            on_right_yaxis = false
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.hosts{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_hosts}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number of hosts running (count)"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_hosts
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_hosts
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for Infrastructure (USD) on-demand"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_hosts}) * ${local.price_on_demand_host}, 0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          precision = 0
          custom_unit = "$"
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        note_definition {
          content = "${local.included_containers} containers are included per Infra Host"
          background_color = "white"
          font_size = "16"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 2
          width = 3
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Number of containers running"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.containers{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            formula {
              formula_expression = "month_before(query0)"
            }
            on_right_yaxis = false
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.containers{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " included "
            value = "y = ${var.commited_hosts * local.included_containers}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 3
          y = 2
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number of containers running (count)"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.containers{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_hosts * local.included_containers
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_hosts * local.included_containers
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 6
          y = 2
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "on-demand containers"
          request {
            formula {
              formula_expression = "clamp_min(default_zero(query2) - max(default_zero(query1), ${var.commited_hosts}) * ${local.included_containers}, 0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.containers{*}"
                data_source = "metrics"
                name = "query2"
                aggregator = "max"
              }
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 9
          y = 2
          width = 3
          height = 2
        }
      }
      widget {
        note_definition {
          content = "${local.included_metrics} Custom metrics are included per Infra Host"
          background_color = "white"
          font_size = "16"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 4
          width = 3
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Number of custom metrics"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.metrics.custom{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            on_right_yaxis = false
            formula {
              formula_expression = "month_before(query0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.metrics.custom{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " included "
            value = "y = ${var.commited_hosts * local.included_metrics}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 3
          y = 4
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number of custom metrics"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.metrics.custom{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_hosts * local.included_metrics
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_hosts * local.included_metrics
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 6
          y = 4
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for on-demand custom metrics"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query2) - max(default_zero(query1), ${var.commited_hosts}) * ${local.included_metrics}) / 100 * 0.008, 0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.metrics.custom{*}"
                data_source = "metrics"
                name = "query2"
                aggregator = "max"
              }
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          precision = 0
          custom_unit = "$"
        }
        widget_layout {
          x = 9
          y = 4
          width = 3
          height = 2
        }
      }
      widget {
        note_definition {
          content = "${local.included_events} Custom events are included per Infra Host"
          background_color = "white"
          font_size = "16"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 6
          width = 3
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Number of custom events"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.events.custom_events{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            on_right_yaxis = false
            formula {
              formula_expression = "month_before(query0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.events.custom_events{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " included "
            value = "y = ${var.commited_hosts * local.included_events}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 3
          y = 6
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number of custom events"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.events.custom_events{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_hosts * local.included_events
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_hosts * local.included_events
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 6
          y = 6
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for on-demand custom events"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query2) - max(default_zero(query1), ${var.commited_hosts}) * ${local.included_events}) / 100000 * 3, 0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.events.custom_events{*}"
                data_source = "metrics"
                name = "query2"
                aggregator = "max"
              }
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          precision = 0
          custom_unit = "$"
        }
        widget_layout {
          x = 9
          y = 6
          width = 3
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 5
      width = 12
      height = 9
    }
  }
  widget {
    group_definition {
      title = "Application Performance Management (APM) "
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "Number APM Agents Running"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm_hosts{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            formula {
              formula_expression = "month_before(query0)"
            }
            on_right_yaxis = false
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm_hosts{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_apm_hosts}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number APM Agents Running (count)"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm_hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_apm_hosts
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_apm_hosts
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for APM (USD) on-demand pricing"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_apm_hosts}) * ${local.price_on_demand_apm}, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm_hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          precision = 0
          custom_unit = "$"
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Number profiled hosts Running"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.profiling.hosts{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            formula {
              formula_expression = "month_before(query0)"
            }
            on_right_yaxis = false
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.profiling.hosts{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${local.profiling_hosts_count}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number profiled hosts (count)"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.profiling.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = local.included_containers
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = local.included_containers
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for profiled hosts (USD) on-demand pricing"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${local.profiling_hosts_count}) * 16, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.profiling.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          precision = 0
          custom_unit = "$"
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        note_definition {
          content = "150GB of **ingested** spans are included per APM host"
          background_color = "white"
          font_size = "16"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 2
          width = 3
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Volume of ingested Spans"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes{*}.as_count()"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            on_right_yaxis = false
            formula {
              formula_expression = "cumsum(month_before(query0))"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes{*}.as_count()"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " included "
            value = "y = ${local.allotment_ingested_spans}"
            display_type = "error dashed"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
        }
        widget_layout {
          x = 3
          y = 2
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Ingested Spans"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "<="
              value = local.allotment_ingested_spans
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = local.allotment_ingested_spans
              palette = "white_on_red"
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 6
          y = 2
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for on-demend Ingested Spans"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) / ${150 * local.gb_to_b} - max(query2, ${var.commited_apm_hosts}) * 150) * 0.1, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm_hosts{*}"
                data_source = "metrics"
                name = "query2"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          precision = 2
          custom_unit = "$"
        }
        widget_layout {
          x = 9
          y = 2
          width = 3
          height = 2
        }
      }
      widget {
        note_definition {
          content = "1 million of **indexed** spans are included per APM host"
          background_color = "white"
          font_size = "16"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 4
          width = 3
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Number of Indexed Spans"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.indexed_spans{*}.as_count()"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            on_right_yaxis = false
            formula {
              formula_expression = "cumsum(month_before(query0))"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.indexed_spans{*}.as_count()"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " included "
            value = "y = ${local.allotment_indexed_spans}"
            display_type = "error dashed"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
        }
        widget_layout {
          x = 3
          y = 4
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Indexed Spans"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.indexed_spans{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "<="
              value = local.allotment_indexed_spans
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = local.allotment_indexed_spans
              palette = "white_on_red"
            }
          }
          autoscale = true
          precision = 2
          custom_unit = "span"
        }
        widget_layout {
          x = 6
          y = 4
          width = 3
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for on-demend Indexed Spans"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${local.allotment_indexed_spans}) / ${local.million} * 2.55, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.indexed_spans{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          custom_unit = "$"
          precision = 2
        }
        widget_layout {
          x = 9
          y = 4
          width = 3
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 14
      width = 12
      height = 7
    }
  }
  widget {
    group_definition {
      title = "Log Management"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "Volume of ingested logs (bytes) "
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(autosmooth(query1))"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.logs.ingested_bytes{*}.as_count()"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "bars"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_ingested_logs * local.gb_to_b}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Volume of ingested logs"
          live_span = "month_to_date"
          request {
            conditional_formats {
              comparator = "<="
              hide_value = false
              palette = "white_on_green"
              value = var.commited_ingested_logs * local.gb_to_b
            }
            conditional_formats {
              comparator = ">"
              hide_value = false
              palette = "white_on_yellow"
              value = var.commited_ingested_logs * local.gb_to_b
            }
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                aggregator = "sum"
                data_source = "metrics"
                name = "query1"
                query = "sum:datadog.estimated_usage.logs.ingested_bytes{*}.as_count()"
              }
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for ingesting logs (USD) on-demand"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_ingested_logs * local.gb_to_b}) / ${local.gb_to_b} * 0.1, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.logs.ingested_bytes{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          precision = 2
          custom_unit = "$"
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Volume of indexed logs"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.logs.ingested_events{datadog_is_excluded:false}.as_count()"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "bars"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_indexed_logs * 1000000}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Volume of indexed logs"
          live_span = "month_to_date"
          request {
            conditional_formats {
              comparator = "<="
              hide_value = false
              palette = "white_on_green"
              value = var.commited_indexed_logs * 1000000
            }
            conditional_formats {
              comparator = ">"
              hide_value = false
              palette = "white_on_yellow"
              value = var.commited_indexed_logs * 1000000
            }
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                aggregator = "sum"
                data_source = "metrics"
                name = "query1"
                query = "sum:datadog.estimated_usage.logs.ingested_events{datadog_is_excluded:false}.as_count()"
              }
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for indexing logs (USD) on-demand"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_indexed_logs * 1000000}) / 2000000 * 1.59, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.logs.ingested_events{datadog_is_excluded:false}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          precision = 2
          custom_unit = "$"
        }
        widget_layout {
          x = 8
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Volume of log scaned for SDS"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(autosmooth(query1))"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.sds.scanned_bytes{*}.as_count()"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "bars"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_sds_logs * local.gb_to_b}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 4
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Volume of log scaned for SDS"
          live_span = "month_to_date"
          request {
            conditional_formats {
              comparator = "<="
              hide_value = false
              palette = "white_on_green"
              value = var.commited_sds_logs * local.gb_to_b
            }
            conditional_formats {
              comparator = ">"
              hide_value = false
              palette = "white_on_yellow"
              value = var.commited_sds_logs * local.gb_to_b
            }
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                aggregator = "avg"
                data_source = "metrics"
                name = "query1"
                query = "sum:datadog.estimated_usage.sds.scanned_bytes{*}.as_count()"
              }
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 4
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for SDS (USD) on-demand"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) / ${var.commited_sds_logs * local.gb_to_b} - 200) * 0.45, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.sds.scanned_bytes{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          custom_unit = "$"
          precision = 2
        }
        widget_layout {
          x = 8
          y = 4
          width = 4
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 21
      width = 12
      height = 5
    }
  }
  widget {
    group_definition {
      title = "Synthetics"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "API tests (count)"
          show_legend = false
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.api_test_runs{*}.as_count()"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "bars"
          }
          request {
            formula {
              formula_expression = "month_before(cumsum(query0))"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.api_test_runs{*}.as_count()"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_synthetics_api * 10000}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "API tests (count)"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.api_test_runs{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_synthetics_api * 10000
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_synthetics_api * 10000
              palette = "white_on_red"
            }
          }
          autoscale = true
          precision = 0
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for API tests on-demand"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) / 10000 - ${var.commited_synthetics_api}) * 7.2, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.api_test_runs{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          precision = 0
          custom_unit = "$"
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Browser tests (count)"
          show_legend = false
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(default_zero(query1))"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.browser_test_runs{*}.as_count()"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            formula {
              formula_expression = "month_before(cumsum(default_zero(query0)))"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.browser_test_runs{*}.as_count()"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_synthetics_browser * 1000}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Browser tests (count)"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.browser_test_runs{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_synthetics_browser * 1000
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_synthetics_browser * 1000
              palette = "white_on_red"
            }
          }
          autoscale = true
          precision = 0
        }
        widget_layout {
          x = 4
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for Browser tests on-demand"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) / 1000 - ${var.commited_synthetics_browser}) * 18, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.browser_test_runs{*}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = false
          custom_unit = "$"
          precision = 0
        }
        widget_layout {
          x = 8
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Mobile tests (count)"
          show_legend = false
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(default_zero(query1))"
            }
            query {
              metric_query {
                query = "sum:synthetics.test_runs{check_type:mobile_app}.as_count()"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            formula {
              formula_expression = "month_before(cumsum(default_zero(query0)))"
            }
            query {
              metric_query {
                query = "sum:synthetics.test_runs{check_type:mobile_app}.as_count()"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_synthetics_mobile * 100}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 4
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Mobile tests (count)"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "sum:synthetics.test_runs{check_type:mobile_app}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_synthetics_mobile * 100
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_synthetics_mobile * 100
              palette = "white_on_red"
            }
          }
          autoscale = true
          precision = 0
        }
        widget_layout {
          x = 4
          y = 4
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for Mobile tests on-demand"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_synthetics_mobile}) / 100 * 72, 0)"
            }
            query {
              metric_query {
                query = "sum:synthetics.test_runs{check_type:mobile_app}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = false
          precision = 0
          custom_unit = "$"
        }
        widget_layout {
          x = 8
          y = 4
          width = 4
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 26
      width = 12
      height = 7
    }
  }
  widget {
    group_definition {
      title = "DBM"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "Number of hosts running"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.dbm.hosts{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            formula {
              formula_expression = "month_before(query0)"
            }
            on_right_yaxis = false
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.dbm.hosts{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_dbm_hosts}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number of hosts running (count)"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.dbm.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_dbm_hosts
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_dbm_hosts
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for DBM (USD) on-demand"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_dbm_hosts}) * 84, 0)"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.dbm.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          custom_unit = "$"
          precision = 0
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 32
      width = 12
      height = 3
      is_column_break = true
    }
  }
  widget {
    group_definition {
      title = "Observability Pipelines"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "Ingested bytes"
          title_size = "16"
          title_align = "left"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(query1)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "sum:datadog.estimated_usage.observability_pipelines.ingested_bytes{*}"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_op_ingested_logs * local.gb_to_b}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Ingested bytes"
          title_size = "16"
          title_align = "left"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "sum:datadog.estimated_usage.observability_pipelines.ingested_bytes{*}"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_op_ingested_logs * local.gb_to_b
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_op_ingested_logs * local.gb_to_b
              palette = "white_on_red"
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for Ingested bytes on-demand"
          title_size = "16"
          title_align = "left"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) / ${local.gb_to_b} - ${var.commited_op_ingested_logs}) * 0.12, 0)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "sum:datadog.estimated_usage.observability_pipelines.ingested_bytes{*}"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          custom_unit = "$"
          precision = 2
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 36
      width = 12
      height = 3
    }
  }
  widget {
    group_definition {
      title = "RUM"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "RUM Session Replay"
          title_size = "16"
          title_align = "left"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(query1)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.rum.sessions{sku:replay}"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_rum_replay * 1000}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "RUM Session Replay"
          title_size = "16"
          title_align = "left"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.rum.sessions{sku:replay}"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_rum_replay * 1000
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_rum_replay * 1000
              palette = "white_on_red"
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for RUM Session Replay on-demand"
          title_size = "16"
          title_align = "left"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) / 1000 - ${var.commited_rum_replay}) * 2.6, 0)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.rum.sessions{sku:replay}"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          custom_unit = "$"
          precision = 2
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "RUM Browser or Mobile Sessions"
          title_size = "16"
          title_align = "left"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "cumsum(query1)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.rum.sessions{! sku:replay}"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_rum_sessions * 1000}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "RUM Browser or Mobile Sessions"
          title_size = "16"
          title_align = "left"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.rum.sessions{!sku:replay}"
                aggregator = "sum"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_rum_sessions * 1000
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_rum_sessions * 1000
              palette = "white_on_red"
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for RUM Browser or Mobile Sessions"
          title_size = "16"
          title_align = "left"
          live_span = "month_to_date"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) / 1000 - ${var.commited_rum_sessions}) * 2.2, 0)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.rum.sessions{!sku:replay}"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          custom_unit = "$"
          precision = 2
        }
        widget_layout {
          x = 8
          y = 2
          width = 4
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 39
      width = 12
      height = 5
    }
  }
  widget {
    group_definition {
      title = "CI Visibility"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "Pipeline Visibility nb Commiters"
          title_size = "16"
          title_align = "left"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.ci_visibility.pipeline.committers{*}"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_ci_visibility_pipeline_committers}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Pipeline Visibility nb Commiters"
          title_size = "16"
          title_align = "left"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.ci_visibility.pipeline.committers{*}"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_ci_visibility_pipeline_committers
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_ci_visibility_pipeline_committers
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for Pipeline Visibility nb Commiters on-demand"
          title_size = "16"
          title_align = "left"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_ci_visibility_pipeline_committers}) * 12, 0)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.ci_visibility.pipeline.committers{*}"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          custom_unit = "$"
          precision = 2
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Testing Visibility nb Commiters"
          title_size = "16"
          title_align = "left"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.ci_visibility.test.committers{*}"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_ci_visibility_test_committers}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Testing Visibility nb Commiters"
          title_size = "16"
          title_align = "left"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.ci_visibility.test.committers{*}"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_ci_visibility_test_committers
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_ci_visibility_test_committers
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for Testing Visibility nb Commiters on-demand"
          title_size = "16"
          title_align = "left"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_ci_visibility_test_committers}) * 29, 0)"
            }
            query {
              metric_query {
                name = "query1"
                data_source = "metrics"
                query = "avg:datadog.estimated_usage.ci_visibility.test.committers{*}"
                aggregator = "avg"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          autoscale = true
          custom_unit = "$"
          precision = 2
        }
        widget_layout {
          x = 8
          y = 2
          width = 4
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 44
      width = 12
      height = 5
    }
  }
  widget {
    group_definition {
      title = "Network"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "Number of hosts NPM running"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.network.hosts{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            on_right_yaxis = false
            formula {
              formula_expression = "month_before(query0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.network.hosts{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_network_hosts}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number of hosts running (count)"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.network.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_network_hosts
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_network_hosts
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for Infrastructure (USD) on-demand"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_network_hosts}) * 5, 0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.network.hosts{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          custom_unit = "$"
          precision = 0
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        timeseries_definition {
          title = "Number of NDM devices running"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.network.devices{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            on_right_yaxis = false
            formula {
              formula_expression = "month_before(query0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.network.devices{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_network_devices}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number of NDM devices running (count)"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.network.devices{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_network_devices
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_network_devices
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 4
          y = 2
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for NDM devices (USD) on-demand"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_network_devices}) * 10.20, 0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.network.devices{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          custom_unit = "$"
          precision = 0
        }
        widget_layout {
          x = 8
          y = 2
          width = 4
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 49
      width = 12
      height = 3
    }
  }
  widget {
    group_definition {
      title = "Security"
      layout_type = "ordered"
      widget {
        timeseries_definition {
          title = "Number of SCA hosts running"
          show_legend = true
          legend_layout = "auto"
          legend_columns = ["avg","min","max","value","sum"]
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.asm.vulnerability_oss_host{*}"
                data_source = "metrics"
                name = "query1"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "area"
          }
          request {
            on_right_yaxis = false
            formula {
              formula_expression = "month_before(query0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.asm.vulnerability_oss_host{*}"
                data_source = "metrics"
                name = "query0"
              }
            }
            style {
              palette = "dog_classic"
              line_type = "solid"
              line_width = "normal"
            }
            display_type = "line"
          }
          yaxis {
            include_zero = true
            scale = "linear"
            min = "auto"
            max = "auto"
          }
          marker {
            label = " commit "
            value = "y = ${var.commited_asm_sca_hosts}"
            display_type = "error dashed"
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Number of SCA hosts running (count)"
          request {
            formula {
              formula_expression = "default_zero(query1)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.asm.vulnerability_oss_host{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "<="
              value = var.commited_asm_sca_hosts
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = var.commited_asm_sca_hosts
              palette = "white_on_red"
            }
          }
          precision = 0
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "Est. Cost for SCA hosts (USD) on-demand"
          request {
            formula {
              formula_expression = "clamp_min((default_zero(query1) - ${var.commited_asm_sca_hosts}) * 15, 0)"
            }
            query {
              metric_query {
                query = "avg:datadog.estimated_usage.asm.vulnerability_oss_host{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "max"
              }
            }
            conditional_formats {
              comparator = "="
              value = 0
              palette = "white_on_green"
            }
            conditional_formats {
              comparator = ">"
              value = 0
              palette = "white_on_yellow"
            }
          }
          precision = 0
          custom_unit = "$"
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 2
        }
      }
    }
    widget_layout {
      x = 0
      y = 52
      width = 12
      height = 3
    }
  }
  layout_type = "ordered"
  notify_list = []
  reflow_type = "fixed"
}