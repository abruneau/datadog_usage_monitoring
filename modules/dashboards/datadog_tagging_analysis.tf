resource "datadog_dashboard" "tagging_dashboard" {
  title = "Datadog Tagging Analysis"
  widget {
    note_definition {
      content = "# Tagging AnalyticsTagging is critical for multiple use cases:- connect products ([unified service tagging](https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging/))- ease search on any context (team, service, etc.)- allocate costs"
      background_color = "white"
      font_size = "14"
      text_align = "left"
      show_tick = false
      tick_pos = "50%"
      tick_edge = "left"
    }
    widget_layout {
      x = 0
      y = 0
      width = 9
      height = 4
    }
  }
  widget {
    image_definition {
      url = "https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_white.png?auto=format&fit=max&w=847"
      sizing = "zoom"
    }
    widget_layout {
      x = 9
      y = 0
      width = 3
      height = 4
    }
  }
  widget {
    group_definition {
      title = "RUM :: Tag Analytics"
      background_color = "blue"
      layout_type = "ordered"
      widget {
        note_definition {
          content = "# RUM Tags- `env` and `service` are two technical tags- `team` and `cost_center` could be added as a global context for cost allocation and filter on your apps.    - [Add global context on browser RUM](https://docs.datadoghq.com/real_user_monitoring/browser/modifying_data_and_context/?tab=npm#add-global-context)    - [Add global context on Android RUM](https://docs.datadoghq.com/real_user_monitoring/android/advanced_configuration/?tab=kotlin#track-attributes)     - [Add global context on iOS RUM](https://docs.datadoghq.com/real_user_monitoring/ios/advanced_configuration/?tab=swift#set-a-custom-global-attribute)     - [Add global context on React Native RUM](https://docs.datadoghq.com/real_user_monitoring/reactnative/#global-attributes)     - [Add global context on Flutter RUM - TODO](#)     - [Connect RUM and Traces](https://docs.datadoghq.com/real_user_monitoring/connect_rum_and_traces/)Note: The business tags added have to be added as a facet.Recommendation: On the graphs below, select the largest `N/A` areas and add the relevant tags or global context accordingly."
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = false
          tick_pos = "50%"
          tick_edge = "left"
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        query_value_definition {
          title = "No env tag"
          title_size = "16"
          title_align = "left"
          request {
            formula {
              formula_expression = "query2"
            }
            query {
              event_query {
                search {
                  query = "@type:session -env:* $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query2"
                indexes = ["*"]
              }
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 0
          width = 2
          height = 2
        }
      }
      widget {
        query_table_definition {
          title = "Top env tags"
          title_size = "16"
          title_align = "left"
          request {
            query {
              event_query {
                search {
                  query = "@type:session $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query2"
                indexes = ["*"]
                group_by {
                  facet = "env"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
            formula {
              formula_expression = "query2"
            }
          }
        }
        widget_layout {
          x = 6
          y = 0
          width = 2
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "No service tag"
          title_size = "16"
          title_align = "left"
          request {
            formula {
              formula_expression = "query2"
            }
            query {
              event_query {
                search {
                  query = "@type:session -service:* $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query2"
                indexes = ["*"]
              }
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 8
          y = 0
          width = 2
          height = 2
        }
      }
      widget {
        query_table_definition {
          title = "Top service tags"
          title_size = "16"
          title_align = "left"
          request {
            query {
              event_query {
                search {
                  query = "@type:session $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query2"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
            formula {
              formula_expression = "query2"
            }
          }
        }
        widget_layout {
          x = 10
          y = 0
          width = 2
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "No team tag"
          title_size = "16"
          title_align = "left"
          request {
            formula {
              formula_expression = "query2"
            }
            query {
              event_query {
                search {
                  query = "@type:session -@team:* $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query2"
                indexes = ["*"]
              }
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 4
          y = 2
          width = 2
          height = 2
        }
      }
      widget {
        query_table_definition {
          title = "Top team facets"
          title_size = "16"
          title_align = "left"
          request {
            query {
              event_query {
                search {
                  query = "@type:session $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query2"
                indexes = ["*"]
                group_by {
                  facet = "@team"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
            formula {
              formula_expression = "query2"
            }
          }
        }
        widget_layout {
          x = 6
          y = 2
          width = 2
          height = 2
        }
      }
      widget {
        query_value_definition {
          title = "No cost_center tag"
          title_size = "16"
          title_align = "left"
          request {
            formula {
              formula_expression = "query2"
            }
            query {
              event_query {
                search {
                  query = "@type:session -@cost_center:* $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query2"
                indexes = ["*"]
              }
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 8
          y = 2
          width = 2
          height = 2
        }
      }
      widget {
        query_table_definition {
          title = "Top cost_center facets"
          title_size = "16"
          title_align = "left"
          request {
            query {
              event_query {
                search {
                  query = "@type:session -@cost_center:* $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query2"
                indexes = ["*"]
                group_by {
                  facet = "@cost_center"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
            formula {
              formula_expression = "query2"
            }
          }
        }
        widget_layout {
          x = 10
          y = 2
          width = 2
          height = 2
        }
      }
      widget {
        treemap_definition {
          title = "Services by env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              event_query {
                search {
                  query = "@type:session $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
                group_by {
                  facet = "env"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
          }
        }
        widget_layout {
          x = 0
          y = 4
          width = 4
          height = 5
        }
      }
      widget {
        treemap_definition {
          title = "Services by team "
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              event_query {
                search {
                  query = "@type:session $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
                group_by {
                  facet = "@team"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
          }
        }
        widget_layout {
          x = 4
          y = 4
          width = 4
          height = 5
        }
      }
      widget {
        treemap_definition {
          title = "Services by cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              event_query {
                search {
                  query = "@type:session $env $service $at_team"
                }
                data_source = "rum"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
                group_by {
                  facet = "@cost_center"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
          }
        }
        widget_layout {
          x = 8
          y = 4
          width = 4
          height = 5
        }
      }
    }
    widget_layout {
      x = 0
      y = 4
      width = 12
      height = 10
    }
  }
  widget {
    group_definition {
      title = "APM :: Tag Analytics"
      background_color = "purple"
      layout_type = "ordered"
      widget {
        note_definition {
          content = "# APM Tags- `env`, `version` and `service` are three technical tags- `team` and `cost_center` could be added as default tags on all deployment through the `DD_TAGS` environment variable.- [Connect Logs and Traces](https://docs.datadoghq.com/tracing/connect_logs_and_traces/)- [Connect RUM and Traces](https://docs.datadoghq.com/real_user_monitoring/connect_rum_and_traces/)Recommendation: On the graphs below, select the largest `N/A` areas and add the relevant tags or global context accordingly."
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = false
          tick_pos = "50%"
          tick_edge = "left"
        }
        widget_layout {
          x = 0
          y = 0
          width = 7
          height = 3
        }
      }
      widget {
        note_definition {
          content = " "
          background_color = "white"
          font_size = "14"
          text_align = "left"
          show_tick = false
          tick_pos = "50%"
          tick_edge = "left"
        }
        widget_layout {
          x = 7
          y = 0
          width = 5
          height = 3
        }
      }
      widget {
        note_definition {
          content = "## Main APM tagsRecommendation: Make sure that `env` and `service` are not default and that each service has a unique name.Common pitfall: Use the `DD_SERVICE_MAPPING` environment variable to uniquely name your databases or other auto instrumented services. [Doc per language](https://docs.datadoghq.com/search/?s=DD_SERVICE_MAPPING)"
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 3
          width = 2
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...apm.ingested_bytes by service and env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes{$env,$service} by {service,env}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 2
          y = 3
          width = 5
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...apm.indexed_spans by service and env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.indexed_spans{$env,$service} by {service,env}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 7
          y = 3
          width = 5
          height = 3
        }
      }
      widget {
        note_definition {
          content = "## Host based tags*Those recommendations have to be adjusted in the case of a shared cluster.*As much as possible, add at a host level the tags `cost_center` and `team`.Recommendation: On the graphs on the right, select the largest `N/A` areas and add the relevant tags or global context accordingly."
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 6
          width = 2
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...apm.ingested_bytes.by_tag by team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes.by_tag{$team,$cost_center,$service} by {service,team}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 2
          y = 6
          width = 5
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...apm.ingested_bytes_by_host by cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes_by_host{$env,$team,$cost_center} by {cost_center}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 7
          y = 6
          width = 5
          height = 3
        }
      }
      widget {
        note_definition {
          content = "## Custom APM service tags*Enterprise customers only*Recommendation: Make sure that `team` and `cost_center` are available on all ingested spans. Use the environment variable `DD_TAGS` or similar to add those tags at the SDK levelNote: For enterprise customers, those metrics `by_tag` can be requested to our support `help.datadoghq.com`. Two tags can be requested as long as the cardinality is not too high. `team` and `cost_center` should be good."
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 9
          width = 2
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...apm.ingested_bytes_by_host by team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes_by_host{$env,$team,$cost_center} by {team}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 2
          y = 9
          width = 5
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...apm.ingested_bytes.by_tag by cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes.by_tag{$team,$cost_center,$service} by {service,cost_center}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 7
          y = 9
          width = 5
          height = 3
        }
      }
      widget {
        note_definition {
          content = "## Service MappingEach service should have a unique name. Make sure to use `DD_SERVICE_MAPPING` environment variable to uniquely name your databases or other auto instrumented services. [Doc per language](https://docs.datadoghq.com/search/?s=DD_SERVICE_MAPPING)Note: The list on the right is not exhaustive"
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 12
          width = 2
          height = 3
        }
      }
      widget {
        query_table_definition {
          title = "Non remapped services"
          title_size = "16"
          title_align = "left"
          request {
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.apm.ingested_bytes{service IN (mongodb,redis,redisdb,mysql,postgresql,postgres,pdo)} by {service}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
            formula {
              formula_expression = "query1"
            }
          }
          has_search_bar = "auto"
        }
        widget_layout {
          x = 2
          y = 12
          width = 3
          height = 3
        }
      }
      widget {
        note_definition {
          content = "## VersionEach service should have version. Make sure to use `DD_VERSION` environment variable. [Docs](https://docs.datadoghq.com/search/?s=DD_VERSION)This helps connect different product in Datadog, helps alert on faulty deployments and more."
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 5
          y = 12
          width = 2
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Indexed spans by service and version"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              event_query {
                search {
                  query = "retained_by:retention_filter"
                }
                data_source = "spans"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = []
                group_by {
                  facet = "@service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
                group_by {
                  facet = "@version"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
          }
        }
        widget_layout {
          x = 7
          y = 12
          width = 3
          height = 3
        }
      }
      widget {
        query_table_definition {
          title = "Services without version"
          request {
            query {
              event_query {
                search {
                  query = "-@version:* -version:* retained_by:retention_filter"
                }
                data_source = "spans"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = []
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
            formula {
              formula_expression = "query1"
            }
          }
        }
        widget_layout {
          x = 10
          y = 12
          width = 2
          height = 3
        }
      }
    }
    widget_layout {
      x = 0
      y = 14
      width = 12
      height = 16
    }
  }
  widget {
    group_definition {
      title = "Logs :: Tag Analytics"
      background_color = "orange"
      layout_type = "ordered"
      widget {
        note_definition {
          content = "# Log Tags- `env`, `source`, `status` and `service` are four technical tags- `team` and `cost_center` could be added as default tags on all deployment to make sure they are attached to each log.- [Connect Logs and Traces](https://docs.datadoghq.com/tracing/connect_logs_and_traces/)- [Connect RUM and Traces](https://docs.datadoghq.com/real_user_monitoring/connect_rum_and_traces/)Recommendation: On the graphs below, select the largest `N/A` areas and add the relevant tags or global context accordingly."
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = false
          tick_pos = "50%"
          tick_edge = "left"
        }
        widget_layout {
          x = 0
          y = 0
          width = 7
          height = 3
        }
      }
      widget {
        note_definition {
          content = " "
          background_color = "white"
          font_size = "14"
          text_align = "left"
          show_tick = false
          tick_pos = "50%"
          tick_edge = "left"
        }
        widget_layout {
          x = 7
          y = 0
          width = 5
          height = 3
        }
      }
      widget {
        note_definition {
          content = "## Main Log tagsRecommendation: Make sure that `env`, `service`, `source` and `status` are populated.Note: The `env` tag often comes from the underlying host.Note: The `status` tag can be mapped with a [log status remapper](https://docs.datadoghq.com/logs/log_configuration/processors/?tab=ui#log-status-remapper)"
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 3
          width = 2
          height = 6
        }
      }
      widget {
        query_value_definition {
          title = "No source tag by service"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              event_query {
                search {
                  query = "-source:* $env $team $service $cost_center"
                }
                data_source = "logs"
                compute {
                  metric = "service"
                  aggregation = "cardinality"
                }
                name = "query1"
                indexes = ["*"]
              }
            }
          }
          autoscale = true
          precision = 2
        }
        widget_layout {
          x = 2
          y = 3
          width = 2
          height = 3
        }
      }
      widget {
        toplist_definition {
          title = "No env tag by service"
          request {
            query {
              event_query {
                search {
                  query = "-env:* $env $team $service $cost_center"
                }
                data_source = "logs"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
            formula {
              formula_expression = "query1"
            }
          }
        }
        widget_layout {
          x = 4
          y = 3
          width = 2
          height = 3
        }
      }
      widget {
        toplist_definition {
          title = "No status tag by service"
          request {
            query {
              event_query {
                search {
                  query = "-status:* $env $team $service $cost_center"
                }
                data_source = "logs"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
            formula {
              formula_expression = "query1"
            }
          }
        }
        widget_layout {
          x = 6
          y = 3
          width = 2
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Logs by service and source"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              event_query {
                search {
                  query = "$env $team $service $cost_center"
                }
                data_source = "logs"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
                group_by {
                  facet = "source"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
          }
        }
        widget_layout {
          x = 8
          y = 3
          width = 4
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Logs by service and env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              event_query {
                search {
                  query = "$env $team $service $cost_center"
                }
                data_source = "logs"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
                group_by {
                  facet = "env"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
          }
        }
        widget_layout {
          x = 2
          y = 6
          width = 5
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Logs by service and status"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              event_query {
                search {
                  query = "$env $team $service $cost_center"
                }
                data_source = "logs"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
                group_by {
                  facet = "status"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
          }
        }
        widget_layout {
          x = 7
          y = 6
          width = 5
          height = 3
        }
      }
      widget {
        note_definition {
          content = "## Additional log service tags*Enterprise customers only*Recommendation: Make sure that `team`, `cost_center` and `status` are available on all ingested logs. Use the environment variable `DD_TAGS` or similar to add those tags at the log collection level.Note: Those tags are recommended to be tags and not facets. To map a facet to a tag, use a [remapper](https://docs.datadoghq.com/logs/log_configuration/processors/?tab=ui#remapper)"
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 9
          width = 2
          height = 6
        }
      }
      widget {
        toplist_definition {
          title = "No cost_center tag by service"
          request {
            query {
              event_query {
                search {
                  query = "-cost_center:* $env $team $service $cost_center"
                }
                data_source = "logs"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
            formula {
              formula_expression = "query1"
            }
          }
        }
        widget_layout {
          x = 2
          y = 9
          width = 2
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...logs.ingested_events by service and status"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.logs.ingested_events{$service} by {service,status}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 7
          y = 9
          width = 5
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Logs by service and cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              event_query {
                search {
                  query = "$env $team $service $cost_center"
                }
                data_source = "logs"
                compute {
                  aggregation = "count"
                }
                name = "query1"
                indexes = ["*"]
                group_by {
                  facet = "service"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
                group_by {
                  facet = "cost_center"
                  sort {
                    aggregation = "count"
                    order = "desc"
                  }
                  limit = 10
                }
              }
            }
          }
        }
        widget_layout {
          x = 2
          y = 12
          width = 5
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...logs.ingested_events.team by service and team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.logs.ingested_events.team{$service,$team} by {service,team}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 7
          y = 12
          width = 5
          height = 3
        }
      }
    }
    widget_layout {
      x = 0
      y = 30
      width = 12
      height = 16
    }
  }
  widget {
    group_definition {
      title = "Monitors :: Tag Analytics"
      background_color = "orange"
      layout_type = "ordered"
      widget {
        note_definition {
          content = "# Monitor TagsTagging monitors is important. It does not affect the behavior of the monitor but it help the platform connect objects and help organize the content. Highly recommended tags    - team    - env    - service    - terraform:true    - priority"
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = false
          tick_pos = "50%"
          tick_edge = "left"
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        manage_status_definition {
          title = "No team tag"
          title_size = "13"
          title_align = "left"
          display_format = "countsAndList"
          color_preference = "text"
          hide_zero_counts = true
          query = "-team:* $env $team $service *"
          sort = "priority,asc"
          summary_type = "combined"
          show_last_triggered = true
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        manage_status_definition {
          title = "No env tag"
          title_size = "13"
          title_align = "left"
          display_format = "countsAndList"
          color_preference = "text"
          hide_zero_counts = true
          query = "-env:* $env $team $service *"
          sort = "priority,asc"
          summary_type = "combined"
          show_last_triggered = true
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        manage_status_definition {
          title = "Tagged with `terraform:true`"
          title_size = "13"
          title_align = "left"
          display_format = "countsAndList"
          color_preference = "text"
          hide_zero_counts = true
          query = "tag:(terraform:true) $env $team $service *"
          sort = "priority,asc"
          summary_type = "combined"
          show_last_triggered = true
        }
        widget_layout {
          x = 0
          y = 4
          width = 4
          height = 4
        }
      }
      widget {
        manage_status_definition {
          title = "No service tag"
          title_size = "13"
          title_align = "left"
          display_format = "countsAndList"
          color_preference = "text"
          hide_zero_counts = true
          query = "-service:* $env $team $service *"
          sort = "priority,asc"
          summary_type = "combined"
          show_last_triggered = true
        }
        widget_layout {
          x = 4
          y = 4
          width = 4
          height = 4
        }
      }
      widget {
        manage_status_definition {
          title = "Priority not defined and notification set"
          title_size = "13"
          title_align = "left"
          display_format = "countsAndList"
          color_preference = "text"
          hide_zero_counts = true
          query = "priority:not_defined notification:* $env $team $service *"
          sort = "priority,asc"
          summary_type = "combined"
          show_last_triggered = true
        }
        widget_layout {
          x = 8
          y = 4
          width = 4
          height = 4
        }
      }
    }
    widget_layout {
      x = 0
      y = 46
      width = 12
      height = 9
    }
  }
  widget {
    group_definition {
      title = "Container :: Tag Analytics"
      background_color = "green"
      layout_type = "ordered"
      widget {
        note_definition {
          content = "# Container Tags- `env`, `service` and `version` are three technical tags to support connection between data sources thanks to the [Unified Service Tagging](https://docs.datadoghq.com/getting_started/tagging/unified_service_tagging/)- `team` and `cost_center` could be added as default tags on each Kubernetes object. Follow the doc above for similar an example or this [tag autodiscovery doc](https://docs.datadoghq.com/agent/kubernetes/tag/?tab=containerizedagent#tag-autodiscovery)Recommendation: On the graphs below, select the largest `N/A` areas and add the relevant tags or global context accordingly."
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = false
          tick_pos = "50%"
          tick_edge = "left"
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Containers by service"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:docker.containers.running{$env,$cost_center,$team,$service} by {service}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Containers by service and env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:docker.containers.running{$env,$team,$service,$cost_center} by {service,env}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Containers by service and team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:docker.containers.running{$env,$team,$service,$cost_center} by {service,team}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 0
          y = 4
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Containers by service and cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:docker.containers.running{$env,$team,$service,$cost_center} by {service,cost_center}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 4
          y = 4
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Containers by service and version"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:docker.containers.running{$env,$team,$service,$cost_center} by {service,version}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 8
          y = 4
          width = 4
          height = 4
        }
      }
    }
    widget_layout {
      x = 0
      y = 55
      width = 12
      height = 9
      is_column_break = true
    }
  }
  widget {
    group_definition {
      title = "Synthetics :: Tag Analytics"
      background_color = "gray"
      layout_type = "ordered"
      widget {
        note_definition {
          content = "# Synthetics Tags- `env` and `service` are two technical tags- `team` and `cost_center` are business tags to organize those tests.- [Connect Synthetic Tests and Traces](https://docs.datadoghq.com/synthetics/apm/)Recommendation: On the graphs below, select the largest `N/A` areas and add the relevant tags or global context accordingly."
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = false
          tick_pos = "50%"
          tick_edge = "left"
        }
        widget_layout {
          x = 0
          y = 0
          width = 7
          height = 3
        }
      }
      widget {
        note_definition {
          content = " "
          background_color = "white"
          font_size = "14"
          text_align = "left"
          show_tick = false
          tick_pos = "50%"
          tick_edge = "left"
        }
        widget_layout {
          x = 7
          y = 0
          width = 5
          height = 3
        }
      }
      widget {
        treemap_definition {
          title = "Metrics ...synthetics.api_test_runs by env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.api_test_runs{$env,$team,$cost_center,$service} by {env}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 0
          y = 3
          width = 3
          height = 5
        }
      }
      widget {
        treemap_definition {
          title = "Metrics ...synthetics.api_test_runs by service"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.api_test_runs{$env,$team,$cost_center,$service} by {service}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 3
          y = 3
          width = 3
          height = 5
        }
      }
      widget {
        treemap_definition {
          title = "Metrics ...synthetics.api_test_runs by team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.api_test_runs{$env,$team,$cost_center,$service} by {team}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 6
          y = 3
          width = 3
          height = 5
        }
      }
      widget {
        treemap_definition {
          title = "Metrics ...synthetics.api_test_runs by team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.api_test_runs{$env,$team,$cost_center,$service} by {cost_center}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 9
          y = 3
          width = 3
          height = 5
        }
      }
      widget {
        treemap_definition {
          title = "Metrics ...synthetics.browser_test_runs by env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.browser_test_runs{$env,$team,$cost_center,$service} by {env}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 0
          y = 8
          width = 3
          height = 5
        }
      }
      widget {
        treemap_definition {
          title = "Metrics ...synthetics.browser_test_runs by service"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.browser_test_runs{$env,$team,$cost_center,$service} by {service}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 3
          y = 8
          width = 3
          height = 5
        }
      }
      widget {
        treemap_definition {
          title = "Metrics ...synthetics.browser_test_runs by team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.api_test_runs{$env,$team,$cost_center,$service} by {team}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 6
          y = 8
          width = 3
          height = 5
        }
      }
      widget {
        treemap_definition {
          title = "Metrics ...synthetics.browser_test_runs by cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.synthetics.browser_test_runs{$env,$team,$cost_center,$service} by {cost_center}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 9
          y = 8
          width = 3
          height = 5
        }
      }
    }
    widget_layout {
      x = 0
      y = 64
      width = 12
      height = 14
    }
  }
  widget {
    group_definition {
      title = "Custom Metrics :: Tag Analytics (Enterprise only)"
      background_color = "purple"
      layout_type = "ordered"
      widget {
        query_value_definition {
          title = "Custom metric volume without team or service"
          request {
            formula {
              formula_expression = "query1 - query2"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.metrics.custom{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.metrics.custom.by_tag{*}"
                data_source = "metrics"
                name = "query2"
                aggregator = "sum"
              }
            }
          }
          autoscale = true
          precision = 2
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
          title = "Custom metric volume without team"
          request {
            formula {
              formula_expression = "query1 - query2"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.metrics.custom{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.metrics.custom.by_tag{team:*}"
                data_source = "metrics"
                name = "query2"
                aggregator = "sum"
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
          title = "Custom metric volume without service "
          request {
            formula {
              formula_expression = "query1 - query2"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.metrics.custom{*}"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.metrics.custom.by_tag{service:*}"
                data_source = "metrics"
                name = "query2"
                aggregator = "sum"
              }
            }
          }
          autoscale = true
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
        note_definition {
          content = "## Custom Metric volume tags*Enterprise customers only*Recommendation: Make sure that `team`, `cost_center` and `service` (if possible) are available on all incoming metrics.Note: For enterprise customers, that metric `by_tag` can be requested to our support `help.datadoghq.com`. Two tags can be requested as long as the cardinality is not too high. `team` and `service` should be good. The `team` tag helps have a overall tracker for each team and the `service` tag helps to narrow down the search."
          background_color = "gray"
          font_size = "14"
          text_align = "left"
          show_tick = true
          tick_pos = "50%"
          tick_edge = "right"
        }
        widget_layout {
          x = 0
          y = 2
          width = 2
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...metrics.custom.by_tag by team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.metrics.custom.by_tag{$team,$service} by {team}"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 2
          y = 2
          width = 5
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Metric ...metrics.custom.by_tag by service"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.estimated_usage.metrics.custom.by_tag{$team,$service} by {service}"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 7
          y = 2
          width = 5
          height = 4
        }
      }
    }
    widget_layout {
      x = 0
      y = 78
      width = 12
      height = 7
    }
  }
  widget {
    group_definition {
      title = "Host :: Tag Analytics"
      background_color = "blue"
      layout_type = "ordered"
      widget {
        treemap_definition {
          title = "Agents per env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.agent.running{*} by {env}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Agent runnings per team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.agent.running{*} by {team}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Agent runnings per cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:datadog.agent.running{*} by {cost_center}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 4
        }
      }
    }
    widget_layout {
      x = 0
      y = 85
      width = 12
      height = 5
    }
  }
  widget {
    group_definition {
      title = "Serverless :: Tag Analytics"
      background_color = "pink"
      layout_type = "ordered"
      widget {
        treemap_definition {
          title = "Lambda invocations by service and env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:aws.lambda.invocations{*} by {service,env}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 0
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "API GW by service and team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:aws.apigateway.count{*} by {service,team}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 4
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Lambda invocations by service and cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:aws.lambda.invocations{*} by {service,cost_center}.as_count()"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 8
          y = 0
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Azure webservers by service and env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:azure.web_serverfarms.count{*} by {service,env}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 0
          y = 4
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Azure webservers by service and team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:azure.web_serverfarms.count{*} by {service,team}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 4
          y = 4
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Azure webservers by service and cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:azure.web_serverfarms.count{*} by {service,cost_center}"
                data_source = "metrics"
                name = "query1"
                aggregator = "avg"
              }
            }
          }
        }
        widget_layout {
          x = 8
          y = 4
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Azure functions requests by service and env"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:azure.functions.requests{*} by {service,env}"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 0
          y = 8
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Azure functions requests by service and team"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:azure.functions.requests{*} by {service,team}"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 4
          y = 8
          width = 4
          height = 4
        }
      }
      widget {
        treemap_definition {
          title = "Azure functions requests by service and cost_center"
          request {
            formula {
              formula_expression = "query1"
            }
            query {
              metric_query {
                query = "sum:azure.functions.requests{*} by {service,cost_center}"
                data_source = "metrics"
                name = "query1"
                aggregator = "sum"
              }
            }
          }
        }
        widget_layout {
          x = 8
          y = 8
          width = 4
          height = 4
        }
      }
    }
    widget_layout {
      x = 0
      y = 90
      width = 12
      height = 13
    }
  }
  template_variable {
    name = "env"
    prefix = "env"
    defaults = ["*"]
  }
  template_variable {
    name = "team"
    prefix = "team"
    defaults = ["*"]
  }
  template_variable {
    name = "cost_center"
    prefix = "cost_center"
    defaults = ["*"]
  }
  template_variable {
    name = "service"
    prefix = "service"
    defaults = ["*"]
  }
  layout_type = "ordered"
  notify_list = []
  reflow_type = "fixed"
}