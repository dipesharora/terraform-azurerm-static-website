# Terraform module for an Azure static website

Provisions an Azure storage account configured for static website hosting.

Enabled for Terraform Cloud [no-code provisioning](https://developer.hashicorp.com/terraform/cloud-docs/no-code-provisioning/module-design).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.73.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.website](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_blob.images](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |
| [azurerm_storage_blob.index](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |
| [random_integer.id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [random_integer.product](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_department"></a> [department](#input\_department) | Value for the department tag. | `string` | `"WebDev"` | no |
| <a name="input_env"></a> [env](#input\_env) | Value for the environment tag. | `string` | n/a | yes |
| <a name="input_hashi_products"></a> [hashi\_products](#input\_hashi\_products) | n/a | <pre>list(object({<br>    name       = string<br>    color      = string<br>    image_file = string<br>  }))</pre> | <pre>[<br>  {<br>    "color": "#dc477d",<br>    "image_file": "hashicafe_art_consul.png",<br>    "name": "Consul"<br>  },<br>  {<br>    "color": "#ffffff",<br>    "image_file": "hashicafe_art_hcp.png",<br>    "name": "HCP"<br>  },<br>  {<br>    "color": "#60dea9",<br>    "image_file": "hashicafe_art_nomad.png",<br>    "name": "Nomad"<br>  },<br>  {<br>    "color": "#63d0ff",<br>    "image_file": "hashicafe_art_packer.png",<br>    "name": "Packer"<br>  },<br>  {<br>    "color": "#844fba",<br>    "image_file": "hashicafe_art_terraform.png",<br>    "name": "Terraform"<br>  },<br>  {<br>    "color": "#2e71e5",<br>    "image_file": "hashicafe_art_vagrant.png",<br>    "name": "Vagrant"<br>  },<br>  {<br>    "color": "#ffec6e",<br>    "image_file": "hashicafe_art_vault.png",<br>    "name": "Vault"<br>  }<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | The region where the resources are created. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | A prefix to add to the storage account name to make it unique. A random number will also be added. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Existing resource group where the static website storage will be created. | `string` | n/a | yes |
| <a name="input_storage_kind"></a> [storage\_kind](#input\_storage\_kind) | Kind of storage account to create. | `string` | `"StorageV2"` | no |
| <a name="input_storage_replication_type"></a> [storage\_replication\_type](#input\_storage\_replication\_type) | Type of replication to use for the storage account. | `string` | `"LRS"` | no |
| <a name="input_storage_tier"></a> [storage\_tier](#input\_storage\_tier) | Tier of the storage account. | `string` | `"Standard"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The storage account's self-hosted static site URL |
| <a name="output_product"></a> [product](#output\_product) | The product which was randomly selected. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the Azure Storage Account that was created. |
<!-- END_TF_DOCS -->