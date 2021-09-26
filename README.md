# terraform-upcloud-server
This module deploys Upcloud server with Public / Private ip address and floating ip support and server rolling maintenance.

These types of resources are used:
* [Upcloud server](https://registry.terraform.io/providers/UpCloudLtd/upcloud/latest/docs/resources/server)
* [Upcloud floating ip address](https://registry.terraform.io/providers/UpCloudLtd/upcloud/latest/docs/resources/floating_ip_address)

## Usage Examples
Some examples can be found in this repository:
* [Server with floating ip address](https://github.com/v0112358/terraform-upcloud-server/tree/master/examples/server-with-floating-ip-address)
* [Server with private networking only](https://github.com/v0112358/terraform-upcloud-server/tree/master/examples/server-with-private-networking-only)
* [Server with public and private networking](https://github.com/v0112358/terraform-upcloud-server/tree/master/examples/server-with-public-and-private-networking)
* [Server with public networking](https://github.com/v0112358/terraform-upcloud-server/tree/master/examples/server-with-public-networking)
* [Server with rolling maintenance](https://github.com/v0112358/terraform-upcloud-server/tree/master/examples/server-with-rolling-maintenance)

If you're looking to try Upcloud out, [sign up here](https://upcloud.com/signup/?promo=ZH2242)
and get $25 free credit.

In case you missed it: Upcloud support [Network Transfer Pool](https://upcloud.com/blog/network-transfer-pool/), as the name suggests, combines all transfer quotas included in all UpCloud public cloud products and services you use into a single account-wide transfer pool.

## Server plans

| Plan        | Price   |
| ----------- | ------- |
| 1xCPU-1GB   | 5 USD   |
| 1xCPU-2GB   | 10 USD  |
| 2xCPU-4GB   | 20 USD  |
| 4xCPU-8GB   | 40 USD  |
| 6xCPU-16GB  | 80 USD  |
| 8xCPU-32GB  | 160 USD |
| 12xCPU-48GB | 240 USD |
| 16xCPU-64GB | 320 USD |
| 20xCPU-96GB | 480 USD |
| 20xCPU-128GB| 640 USD |

See [Upcloud Pricing](https://upcloud.com/pricing/) for more.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_upcloud"></a> [upcloud](#requirement\_upcloud) | ~> 2.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_upcloud"></a> [upcloud](#provider\_upcloud) | ~> 2.1.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [upcloud_floating_ip_address.floating_ip_address](https://registry.terraform.io/providers/UpCloudLtd/upcloud/latest/docs/resources/floating_ip_address) | resource |
| [upcloud_server.server](https://registry.terraform.io/providers/UpCloudLtd/upcloud/latest/docs/resources/server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall"></a> [firewall](#input\_firewall) | Are firewall rules active for the server. | `bool` | `false` | no |
| <a name="input_floating_ip"></a> [floating\_ip](#input\_floating\_ip) | Boolean to control whether floating IPs should be created. | `bool` | `false` | no |
| <a name="input_floating_ip_count"></a> [floating\_ip\_count](#input\_floating\_ip\_count) | The number of floating ip address to create. | `number` | `0` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The id of an image to use. | `string` | `""` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Is the metadata service active for the server. | `bool` | `false` | no |
| <a name="input_private_networking"></a> [private\_networking](#input\_private\_networking) | Boolean to control whether private networking should be created. | `bool` | `false` | no |
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | The private subnet id should be assigned to server. | `string` | `""` | no |
| <a name="input_public_networking"></a> [public\_networking](#input\_public\_networking) | Boolean to control whether public networking should be created. | `bool` | `true` | no |
| <a name="input_rolling_maintenance"></a> [rolling\_maintenance](#input\_rolling\_maintenance) | Server rolling maintenance | <pre>object({<br>    enable       = bool<br>    server_index = list(number)<br>    resize_plan  = string<br>  })</pre> | <pre>{<br>  "enable": false,<br>  "resize_plan": "1xCPU-2GB",<br>  "server_index": [<br>    0<br>  ]<br>}</pre> | no |
| <a name="input_root_disk_size"></a> [root\_disk\_size](#input\_root\_disk\_size) | The size of root disk in gigabytes. | `number` | `"25"` | no |
| <a name="input_server_count"></a> [server\_count](#input\_server\_count) | The number of server resource to create. | `number` | `1` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | A valid domain name. | `string` | `"upserver"` | no |
| <a name="input_server_os"></a> [server\_os](#input\_server\_os) | The template name to use. | `string` | `"CentOS 8"` | no |
| <a name="input_server_size"></a> [server\_size](#input\_server\_size) | The pricing plan used for the server. | `string` | `"1xCPU-1GB"` | no |
| <a name="input_set_password"></a> [set\_password](#input\_set\_password) | Indicates a password should be create to allow access | `bool` | `false` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | A list of ssh keys to access the server. | `list` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of the tags to label this server. | `list` | `[]` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Defines URL for a server setup script, or the script body itself. | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone in which the server will be created. | `string` | `"sg-sin1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_floating_ip_address"></a> [floating\_ip\_address](#output\_floating\_ip\_address) | List of floating IP addresses was created |
| <a name="output_ipv4_address_private"></a> [ipv4\_address\_private](#output\_ipv4\_address\_private) | List of private IPv4 addresses assigned to the server |
| <a name="output_ipv4_address_public"></a> [ipv4\_address\_public](#output\_ipv4\_address\_public) | List of public IPv4 addresses assigned to the server |
| <a name="output_plan"></a> [plan](#output\_plan) | List of plan of server |
| <a name="output_server_hostname"></a> [server\_hostname](#output\_server\_hostname) | List hostname of server |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | List of IDs of server |
| <a name="output_zone"></a> [zone](#output\_zone) | List of zone of server |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License
MIT 

## Author Information

[v0112358](https://github.com/v0112358/)

