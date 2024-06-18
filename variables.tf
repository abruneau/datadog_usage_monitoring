variable "datadog_api_key" {
  type = string
}

variable "datadog_app_key" {
  type = string
}

variable "datadog_api_url" {
  type = string
  default = "https://api.datadoghq.com/"
}

variable "commited_hosts" {
  type = number
  default = 0
}

variable "commited_apm_hosts" {
  type = number
  default = 0
}

variable "commited_ingested_logs" {
  type = number
  default = 0
  description = "value in Gb"
}

variable "commited_indexed_logs" {
  type = number
  default = 0
  description = "value in million events"
}

variable "commited_sds_logs" {
  type = number
  default = 0
  description = "value in Gb"
}

variable "commited_synthetics_api" {
  type = number
  default = 0
  description = "number of 10K test runs"
}

variable "commited_synthetics_browser" {
  type = number
  default = 0
  description = "number of 1K test runs"
}

variable "commited_synthetics_mobile" {
  type = number
  default = 0
  description = "number of 100 test runs"
}

variable "commited_dbm_hosts" {
  type = number
  default = 0
}

variable "commited_op_ingested_logs" {
  type = number
  default = 0
  description = "value in Gb"
}


variable "commited_rum_replay" {
  type = number
  default = 0
  description = "number of 1K sessions"
}

variable "commited_rum_sessions" {
  type = number
  default = 0
  description = "number of 1K sessions"
}

variable "commited_ci_visibility_pipeline_committers" {
  type = number
  default = 0
}

variable "commited_ci_visibility_test_committers" {
  type = number
  default = 0
}

variable "commited_network_hosts" {
  type = number
  default = 0
}

variable "commited_asm_sca_hosts" {
  type = number
  default = 0
}