variable "commited_hosts" {
  type = number
  default = 0
}

variable "host_type" {
  type = string
  default = "pro"
  validation {
    condition     = contains(["pro", "enterprise"], var.host_type)
    error_message = "Valid values for var: host_type are (pro, enterprise)."
  } 
}

locals{
  included_containers = var.host_type == "pro" ? 5 : 10
  included_metrics = var.host_type == "pro" ? 100 : 200
  included_events = var.host_type == "pro" ? 500 : 1000
  price_on_demand_host = var.host_type == "pro" ? 18 : 27
}

variable "commited_apm_hosts" {
  type = number
  default = 0
}

variable "apm_type" {
  type = string
  default = "standard"
  validation {
    condition     = contains([ "standard", "pro", "enterprise"], var.apm_type)
    error_message = "Valid values for var: apm_type are (standard, pro, enterprise)."
  } 
}

variable "commited_profiling_hosts" {
  type = number
  default = 0
  description = "leave to 0 if subscribed through apm enterprise"
}

locals {
  price_on_demand_apm = var.apm_type == "standard" ? 36 : (var.apm_type == "pro" ? 42 : 48)
  profiling_hosts_count = var.apm_type == "enterprise" ? var.commited_apm_hosts : var.commited_profiling_hosts
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

variable "commited_network_devices" {
  type = number
  default = 0
}

variable "commited_asm_sca_hosts" {
  type = number
  default = 0
}