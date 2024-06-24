<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.apm_host_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.apm_indexed_spans_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.apm_indexed_spans_month](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.apm_ingested_spans_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.apm_ingested_spans_month](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.asm_sca_hosts_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.container_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.custom_events](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.custom_metrics](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.dbm_host_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.host_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.logs_indexed_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.logs_indexed_month](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.logs_ingested_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.logs_ingested_month](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.logs_sds_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.logs_sds_month](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.ndm_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.npm_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.op_ingested_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.op_ingested_month](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.pipeline_committers](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.profiling_host_count](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.rum_session](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.rum_session_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.rum_session_replay](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.rum_session_replay_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.synthetics_api_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.synthetics_api_month](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.synthetics_browser_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.synthetics_browser_month](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.synthetics_mobile_day](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.synthetics_mobile_month](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |
| [datadog_monitor.test_committers](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apm_type"></a> [apm\_type](#input\_apm\_type) | n/a | `string` | `"standard"` | no |
| <a name="input_commited_additional_indexed_spans"></a> [commited\_additional\_indexed\_spans](#input\_commited\_additional\_indexed\_spans) | value in million spans | `number` | `0` | no |
| <a name="input_commited_apm_hosts"></a> [commited\_apm\_hosts](#input\_commited\_apm\_hosts) | n/a | `number` | `0` | no |
| <a name="input_commited_asm_sca_hosts"></a> [commited\_asm\_sca\_hosts](#input\_commited\_asm\_sca\_hosts) | n/a | `number` | `0` | no |
| <a name="input_commited_ci_visibility_pipeline_committers"></a> [commited\_ci\_visibility\_pipeline\_committers](#input\_commited\_ci\_visibility\_pipeline\_committers) | n/a | `number` | `0` | no |
| <a name="input_commited_ci_visibility_test_committers"></a> [commited\_ci\_visibility\_test\_committers](#input\_commited\_ci\_visibility\_test\_committers) | n/a | `number` | `0` | no |
| <a name="input_commited_dbm_hosts"></a> [commited\_dbm\_hosts](#input\_commited\_dbm\_hosts) | n/a | `number` | `0` | no |
| <a name="input_commited_hosts"></a> [commited\_hosts](#input\_commited\_hosts) | n/a | `number` | `0` | no |
| <a name="input_commited_indexed_logs"></a> [commited\_indexed\_logs](#input\_commited\_indexed\_logs) | value in million events | `number` | `0` | no |
| <a name="input_commited_ingested_logs"></a> [commited\_ingested\_logs](#input\_commited\_ingested\_logs) | value in Gb | `number` | `0` | no |
| <a name="input_commited_network_devices"></a> [commited\_network\_devices](#input\_commited\_network\_devices) | n/a | `number` | `0` | no |
| <a name="input_commited_network_hosts"></a> [commited\_network\_hosts](#input\_commited\_network\_hosts) | n/a | `number` | `0` | no |
| <a name="input_commited_op_ingested_logs"></a> [commited\_op\_ingested\_logs](#input\_commited\_op\_ingested\_logs) | value in Gb | `number` | `0` | no |
| <a name="input_commited_profiling_hosts"></a> [commited\_profiling\_hosts](#input\_commited\_profiling\_hosts) | leave to 0 if subscribed through apm enterprise | `number` | `0` | no |
| <a name="input_commited_rum_replay"></a> [commited\_rum\_replay](#input\_commited\_rum\_replay) | number of 1K sessions | `number` | `0` | no |
| <a name="input_commited_rum_sessions"></a> [commited\_rum\_sessions](#input\_commited\_rum\_sessions) | number of 1K sessions | `number` | `0` | no |
| <a name="input_commited_sds_logs"></a> [commited\_sds\_logs](#input\_commited\_sds\_logs) | value in Gb | `number` | `0` | no |
| <a name="input_commited_synthetics_api"></a> [commited\_synthetics\_api](#input\_commited\_synthetics\_api) | number of 10K test runs | `number` | `0` | no |
| <a name="input_commited_synthetics_browser"></a> [commited\_synthetics\_browser](#input\_commited\_synthetics\_browser) | number of 1K test runs | `number` | `0` | no |
| <a name="input_commited_synthetics_mobile"></a> [commited\_synthetics\_mobile](#input\_commited\_synthetics\_mobile) | number of 100 test runs | `number` | `0` | no |
| <a name="input_host_type"></a> [host\_type](#input\_host\_type) | n/a | `string` | `"pro"` | no |
| <a name="input_monitors_tags"></a> [monitors\_tags](#input\_monitors\_tags) | n/a | `set(string)` | <pre>[<br>  "service:datadog_usage",<br>  "terraform:true",<br>  "team:datadog_support",<br>  "env:usage"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->