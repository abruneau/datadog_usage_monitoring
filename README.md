<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">

<h3 align="center">Datadog Usage tracking</h3>

  <p align="center">
    This is a Terrafom repository that generates dashboards and monitors to track your Datadog usage based on your commit
    <br />
    <a href="https://github.com/abruneau/datadog_usage_monitoring/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/abruneau/datadog_usage_monitoring/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#terraform-doc">Terraform Doc</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
# About The Project

## Built With

* [![Terraform][Terraform.io]][Terraform-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
# Getting Started

To get a local copy up and running follow these simple example steps.

## Prerequisites

You will need Terrafom installed, and Datadog API key and APP key

## Installation

1. Clone the repo
   ```sh
   git clone https://github.com/abruneau/datadog_usage_monitoring.git
   ```
2. Create a `.tfvars` file with you API Key, APP Key and Datadog commit informations
   ```
   datadog_api_key="<API Key>"
   datadog_app_key="<APP Key>"
   datadog_api_url="https://api.datadoghq.eu/"
   commited_hosts=12
   host_type="enterprise"
   commited_apm_hosts=12
   apm_type="enterprise"
   ...
   ```
3. Init Terraform and apply with your `.tfvars` file
   ```bash
   terraform init
   terraform apply -var-file="my.tfvars"
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Terraform Doc

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dashboards"></a> [dashboards](#module\_dashboards) | ./modules/dashboards | n/a |
| <a name="module_monitors"></a> [monitors](#module\_monitors) | ./modules/monitors | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apm_type"></a> [apm\_type](#input\_apm\_type) | n/a | `string` | `"standard"` | no |
| <a name="input_commited_additional_indexed_spans"></a> [commited\_additional\_indexed\_spans](#input\_commited\_additional\_indexed\_spans) | value in million spans | `number` | `0` | no |
| <a name="input_commited_apm_hosts"></a> [commited\_apm\_hosts](#input\_commited\_apm\_hosts) | n/a | `number` | `0` | no |
| <a name="input_commited_asm_sca_hosts"></a> [commited\_asm\_sca\_hosts](#input\_commited\_asm\_sca\_hosts) | n/a | `number` | `0` | no |
| <a name="input_commited_ci_visibility_pipeline_committers"></a> [commited\_ci\_visibility\_pipeline\_committers](#input\_commited\_ci\_visibility\_pipeline\_committers) | n/a | `number` | `0` | no |
| <a name="input_commited_ci_visibility_test_committers"></a> [commited\_ci\_visibility\_test\_committers](#input\_commited\_ci\_visibility\_test\_committers) | n/a | `number` | `0` | no |
| <a name="input_commited_container_apps"></a> [commited\_container\_apps](#input\_commited\_container\_apps) | n/a | `number` | `0` | no |
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
| <a name="input_commited_serverless_asm_invocations"></a> [commited\_serverless\_asm\_invocations](#input\_commited\_serverless\_asm\_invocations) | n/a | `number` | `0` | no |
| <a name="input_commited_serverless_workload_lambda_invocations"></a> [commited\_serverless\_workload\_lambda\_invocations](#input\_commited\_serverless\_workload\_lambda\_invocations) | n/a | `number` | `0` | no |
| <a name="input_commited_serverless_workload_monitoring_lambda"></a> [commited\_serverless\_workload\_monitoring\_lambda](#input\_commited\_serverless\_workload\_monitoring\_lambda) | n/a | `number` | `0` | no |
| <a name="input_commited_siem_logs"></a> [commited\_siem\_logs](#input\_commited\_siem\_logs) | n/a | `number` | `0` | no |
| <a name="input_commited_synthetics_api"></a> [commited\_synthetics\_api](#input\_commited\_synthetics\_api) | number of 10K test runs | `number` | `0` | no |
| <a name="input_commited_synthetics_browser"></a> [commited\_synthetics\_browser](#input\_commited\_synthetics\_browser) | number of 1K test runs | `number` | `0` | no |
| <a name="input_commited_synthetics_mobile"></a> [commited\_synthetics\_mobile](#input\_commited\_synthetics\_mobile) | number of 100 test runs | `number` | `0` | no |
| <a name="input_datadog_api_key"></a> [datadog\_api\_key](#input\_datadog\_api\_key) | n/a | `string` | n/a | yes |
| <a name="input_datadog_api_url"></a> [datadog\_api\_url](#input\_datadog\_api\_url) | n/a | `string` | `"https://api.datadoghq.com/"` | no |
| <a name="input_datadog_app_key"></a> [datadog\_app\_key](#input\_datadog\_app\_key) | n/a | `string` | n/a | yes |
| <a name="input_host_type"></a> [host\_type](#input\_host\_type) | n/a | `string` | `"pro"` | no |
| <a name="input_monitors_tags"></a> [monitors\_tags](#input\_monitors\_tags) | n/a | `set(string)` | <pre>[<br>  "service:datadog_usage",<br>  "terraform:true",<br>  "team:datadog_support",<br>  "env:usage"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->    
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
# Roadmap

- [ ] Add monitors for more features
- [ ] Add support for bundles

See the [open issues](https://github.com/abruneau/datadog_usage_monitoring/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
# Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
# License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
# Contact

Antonin Bruneau - [abruneau.me](https://abruneau.me) - antonin.bruneau@gmail.com

Project Link: [https://github.com/abruneau/datadog_usage_monitoring](https://github.com/abruneau/datadog_usage_monitoring)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/abruneau/datadog_usage_monitoring.svg?style=for-the-badge
[contributors-url]: https://github.com/abruneau/datadog_usage_monitoring/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/abruneau/datadog_usage_monitoring.svg?style=for-the-badge
[forks-url]: https://github.com/abruneau/datadog_usage_monitoring/network/members
[stars-shield]: https://img.shields.io/github/stars/abruneau/datadog_usage_monitoring.svg?style=for-the-badge
[stars-url]: https://github.com/abruneau/datadog_usage_monitoring/stargazers
[issues-shield]: https://img.shields.io/github/issues/abruneau/datadog_usage_monitoring.svg?style=for-the-badge
[issues-url]: https://github.com/abruneau/datadog_usage_monitoring/issues
[license-shield]: https://img.shields.io/github/license/abruneau/datadog_usage_monitoring.svg?style=for-the-badge
[license-url]: https://github.com/abruneau/datadog_usage_monitoring/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/antoninbruneau
[Terraform.io]: https://img.shields.io/badge/terraform-7B42BC?logo=terraform&logoColor=white&style=for-the-badge
[Terraform-url]: https://terraform.io