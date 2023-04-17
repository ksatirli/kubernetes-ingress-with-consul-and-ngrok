# uncomment this resource if you are NOT using the `helm_release` approach as described below.
# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret
#resource "kubernetes_secret" "main" {
#  metadata {
#    name      = "${kubernetes_namespace.main.id}-credentials"
#    namespace = kubernetes_namespace.main.id
#  }
#
#  data = {
#    "API_KEY"   = var.ngrok_apikey
#    "AUTHTOKEN" = var.ngrok_authtoken
#  }
#}
