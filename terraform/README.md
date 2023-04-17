<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| kubernetes_cluster_ip | Shipyard-provided Kubernetes Cluster IP. | `string` | yes |
| ngrok_apikey | ngrok API Key. | `string` | yes |
| ngrok_authtoken | ngrok CLI Auth Token. | `string` | yes |
| ngrok_domain | ngrok Custom Domain. | `string` | yes |
| kubernetes_config_path | Path to `kubectl` Configuration. | `string` | no |
| kubernetes_context | Kubernetes Context. | `string` | no |
| project_identifier | Project Identifier. | `string` | no |
| sample_app_port | Sample Application Network Port. | `number` | no |

## Outputs

| Name | Description |
|------|-------------|
| command_ngrok_tunnel | Command to create an ngrok Tunnel. |
<!-- END_TF_DOCS -->