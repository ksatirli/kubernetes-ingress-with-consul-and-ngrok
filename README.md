# Kubernetes Ingress with Consul and ngrok

> Sample code for setting up HashiCorp Consul and ngrok Ingress Controllers on Kubernetes

## Table of Contents

<!-- TOC -->
* [Kubernetes Ingress with Consul and ngrok](#kubernetes-ingress-with-consul-and-ngrok)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

* [Docker](https://docs.docker.com/get-docker/)
* [ngrok](https://github.com/ngrok/homebrew-ngrok) `v3.2.2` (or later)
* [Shipyard](https://shipyard.run) `v0.5.2` (or later)
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) `v1.4.5` (or later)

## Usage

This project consists of two components:

* `./shipyard` contains a Shipyard Blueprint to deploy [HashiCorp Consul](https://consul.io/) on Kubernetes.
* `./terraform` contains [HashiCorp Terraform](https://terraform.io/) code to deploy the [ngrok Ingress Controller](https://github.com/ngrok/kubernetes-ingress-controller) and related resources.

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/kubernetes-ingress-with-consul-and-ngrok/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
