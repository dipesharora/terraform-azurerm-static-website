output "endpoint" {
  description = "The storage account's self-hosted static site URL"
  value       = azurerm_storage_account.website.primary_web_endpoint
}

output "product" {
  description = "The product which was randomly selected."
  value       = local.hashi_products[random_integer.product.result].name
}

output "storage_account_name" {
  description = "The name of the Azure Storage Account that was created."
  value       = azurerm_storage_account.website.name
}
