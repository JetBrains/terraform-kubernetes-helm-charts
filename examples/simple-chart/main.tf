/*
  This is an example. Its purpose is to show how to use the module with a simple chart as an input configuration.

  The expected behavior is that the module will create one Helm release.
*/


module "example_simple_chart" {
  source = "../../"
  charts = [{
    namespace  = "kube-github-runners"
    repository = "oci://public.registry.jetbrains.space/p/helm/library/"
    app = {
      create_namespace = true
      name             = "kube-github-runners"
      chart            = "kube-github-runners"
      version          = "0.8.3"
    }
  }]
}
