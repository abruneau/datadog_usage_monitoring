terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = var.datadog_api_url
}

module "monitors" {
  source                                     = "./modules/monitors"
  commited_hosts                             = var.commited_hosts
  host_type                                  = var.host_type
  commited_apm_hosts                         = var.commited_apm_hosts
  apm_type                                   = var.apm_type
  commited_profiling_hosts                   = var.commited_profiling_hosts
  commited_ingested_logs                     = var.commited_ingested_logs
  commited_indexed_logs                      = var.commited_indexed_logs
  commited_sds_logs                          = var.commited_sds_logs
  commited_synthetics_api                    = var.commited_synthetics_api
  commited_synthetics_browser                = var.commited_synthetics_browser
  commited_synthetics_mobile                 = var.commited_synthetics_mobile
  commited_dbm_hosts                         = var.commited_dbm_hosts
  commited_op_ingested_logs                  = var.commited_op_ingested_logs
  commited_rum_replay                        = var.commited_rum_replay
  commited_rum_sessions                      = var.commited_rum_sessions
  commited_ci_visibility_pipeline_committers = var.commited_ci_visibility_pipeline_committers
  commited_ci_visibility_test_committers     = var.commited_ci_visibility_test_committers
  commited_network_hosts                     = var.commited_network_hosts
  commited_network_devices                   = var.commited_network_devices
  commited_asm_sca_hosts                     = var.commited_asm_sca_hosts
}

module "dashboards" {
  source                                     = "./modules/dashboards"
  commited_hosts                             = var.commited_hosts
  host_type                                  = var.host_type
  commited_apm_hosts                         = var.commited_apm_hosts
  apm_type                                   = var.apm_type
  commited_profiling_hosts                   = var.commited_profiling_hosts
  commited_ingested_logs                     = var.commited_ingested_logs
  commited_indexed_logs                      = var.commited_indexed_logs
  commited_sds_logs                          = var.commited_sds_logs
  commited_synthetics_api                    = var.commited_synthetics_api
  commited_synthetics_browser                = var.commited_synthetics_browser
  commited_synthetics_mobile                 = var.commited_synthetics_mobile
  commited_dbm_hosts                         = var.commited_dbm_hosts
  commited_op_ingested_logs                  = var.commited_op_ingested_logs
  commited_rum_replay                        = var.commited_rum_replay
  commited_rum_sessions                      = var.commited_rum_sessions
  commited_ci_visibility_pipeline_committers = var.commited_ci_visibility_pipeline_committers
  commited_ci_visibility_test_committers     = var.commited_ci_visibility_test_committers
  commited_network_hosts                     = var.commited_network_hosts
  commited_network_devices                   = var.commited_network_devices
  commited_asm_sca_hosts                     = var.commited_asm_sca_hosts
}
