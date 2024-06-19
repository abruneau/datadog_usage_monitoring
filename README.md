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
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

### Built With

* [![Terraform][Terraform.io]][Terraform-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

You will need Terrafom installed, and Datadog API key and APP key

### Installation

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

<!-- ROADMAP -->
## Roadmap

- [ ] Add monitors for more features
- [ ] Add support for bundles

See the [open issues](https://github.com/abruneau/datadog_usage_monitoring/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

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
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

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
[license-url]: https://github.com/abruneau/datadog_usage_monitoring/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/antoninbruneau
[Terraform.io]: https://img.shields.io/badge/terraform-7B42BC?logo=terraform&logoColor=white&style=for-the-badge
[Terraform-url]: https://terraform.io