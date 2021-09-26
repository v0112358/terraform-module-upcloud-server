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
* [Server with rolling mainteance](https://github.com/v0112358/terraform-upcloud-server/tree/master/examples/server-with-rolling-maintenance)

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
## Providers

| Name | Version |
|------|---------|
| Upcloud | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|


## Outputs

| Name | Description |
|------|-------------|

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License
MIT 

## Author Information

[v0112358](https://github.com/v0112358/)

