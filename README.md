<!-- BEGIN_TF_DOCS -->
# terraform-kubernetes-helm-charts

[![official JetBrains project](https://jb.gg/badges/official.svg)](https://confluence.jetbrains.com/display/ALL/JetBrains+on+GitHub)

This module allows deploying at least one Helm Chart in a Kubernetes cluster.

## Features

* Allows installing a list of Helm Charts;

* Allows injecting custom values.yaml configurations that will override the default chart's configurations;

* Allows injecting only a few parameters that will override the default chart's configuration;

* Allows injecting secrets in a sensitive manner;

## Core concepts

* [What is Kubernetes?](https://kubernetes.io/docs/home/);

* [What is the Helm Provider for Kubernetes](https://registry.terraform.io/providers/hashicorp/helm/latest/docs);

* [How is configured the Helm Provider in this Module](https://registry.terraform.io/providers/hashicorp/helm/latest/docs#exec-plugins).

## Examples

For how-to examples, please refer to the [examples](./examples) directory.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | = 2.7.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | = 2.7.0 |
## Resources

| Name | Type |
|------|------|
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/2.7.0/docs/resources/release) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_charts"></a> [charts](#input\_charts) | List of Helm Charts to deploy in the Kubernetes cluster. | <pre>list(object({<br>    namespace  = string<br>    repository = string<br>    repository_config = optional(object({<br>      repository_key_file  = optional(string)<br>      repository_cert_file = optional(string)<br>      repository_ca_file   = optional(string)<br>      repository_username  = optional(string)<br>      repository_password  = optional(string)<br>    }))<br>    app = object({<br>      name                       = string<br>      chart                      = string<br>      version                    = string<br>      force_update               = optional(bool)<br>      wait                       = optional(bool)<br>      recreate_pods              = optional(bool)<br>      max_history                = optional(number)<br>      lint                       = optional(bool)<br>      cleanup_on_fail            = optional(bool)<br>      create_namespace           = optional(bool)<br>      disable_webhooks           = optional(bool)<br>      verify                     = optional(bool)<br>      reuse_values               = optional(bool)<br>      reset_values               = optional(bool)<br>      atomic                     = optional(bool)<br>      skip_crds                  = optional(bool)<br>      render_subchart_notes      = optional(bool)<br>      disable_openapi_validation = optional(bool)<br>      wait_for_jobs              = optional(bool)<br>      dependency_update          = optional(bool)<br>      replace                    = optional(bool)<br>    })<br>    values = optional(any)<br>    params = optional(list(object({<br>      name  = string<br>      value = any<br>    })))<br>    secrets = optional(list(object({<br>      name  = string<br>      value = any<br>    })))<br>  }))</pre> | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_charts_info"></a> [charts\_info](#output\_charts\_info) | List of charts and configurations that are deployed in the cluster. |
<!-- END_TF_DOCS -->