<!-- BEGIN_TF_DOCS -->
# terraform-kubernetes-helm-charts

[![official JetBrains project](https://jb.gg/badges/official.svg)](https://confluence.jetbrains.com/display/ALL/JetBrains+on+GitHub)

This module allows to deploy at least one Helm Chart in a Kubernetes cluster.

## Status

Work in progress.

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

No requirements.
## Providers

No providers.
## Resources

No resources.
## Inputs

No inputs.
## Outputs

No outputs.
<!-- END_TF_DOCS -->