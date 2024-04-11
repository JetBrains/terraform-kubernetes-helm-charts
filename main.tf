/**
* The entrypoint for this Module.
*/

locals {
  charts = var.charts
}

resource "helm_release" "this" {
  //count                      = length(local.charts)
  for_each                   = { for c in local.charts : substr(format("%s-%s", c.app.name, c.namespace), 0, 63) => c }
  namespace                  = try(each.value.namespace, "kube-none")
  repository                 = try(each.value.repository, null)
  repository_key_file        = try(lookup(each.value.repository_config, "repository_key_file", null), null)
  repository_cert_file       = try(lookup(each.value.repository_config, "repository_cert_file", null), null)
  repository_ca_file         = try(lookup(each.value.repository_config, "repository_ca_file", null), null)
  repository_username        = try(lookup(each.value.repository_config, "repository_username", null), null)
  repository_password        = try(lookup(each.value.repository_config, "repository_password", null), null)
  name                       = each.value.app["name"]
  version                    = each.value.app["version"]
  chart                      = each.value.app["chart"]
  force_update               = lookup(each.value.app, "force_update", true)
  wait                       = lookup(each.value.app, "wait", true)
  recreate_pods              = lookup(each.value.app, "recreate_pods", false)
  max_history                = lookup(each.value.app, "max_history", 0)
  lint                       = lookup(each.value.app, "lint", true)
  cleanup_on_fail            = lookup(each.value.app, "cleanup_on_fail", true)
  create_namespace           = lookup(each.value.app, "create_namespace", false)
  disable_webhooks           = lookup(each.value.app, "disable_webhooks", false)
  verify                     = lookup(each.value.app, "verify", true)
  reuse_values               = lookup(each.value.app, "reuse_values", false)
  reset_values               = lookup(each.value.app, "reset_values", false)
  atomic                     = lookup(each.value.app, "atomic", false)
  skip_crds                  = lookup(each.value.app, "skip_crds", false)
  render_subchart_notes      = lookup(each.value.app, "render_subchart_notes", true)
  disable_openapi_validation = lookup(each.value.app, "disable_openapi_validation", false)
  wait_for_jobs              = lookup(each.value.app, "wait_for_jobs", true)
  dependency_update          = lookup(each.value.app, "dependency_update", true)
  replace                    = lookup(each.value.app, "replace", false)
  values                     = each.value.values != null ? [each.value.values] : []

  dynamic "set" {
    iterator = item
    for_each = each.value.params == null ? [] : each.value.params

    content {
      name  = item.value.name
      value = item.value.value
    }
  }

  dynamic "set_sensitive" {
    iterator = item
    for_each = each.value.secrets == null ? [] : each.value.secrets

    content {
      name  = item.value.name
      value = item.value.value
    }
  }
}
