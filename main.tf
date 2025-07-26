resource "azurerm_key_vault" "tp2kv" {
  for_each = var.key_volt_map
  name                        = each.value.kv_name 
  location                    = each.value.location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.tanant_block.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.tanant_block.tenant_id
    object_id = data.azurerm_client_config.tanant_block.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
  "Backup",
  "Delete",
  "Get",
  "List",
  "Purge",
  "Recover",
  "Restore",
  "Set"
]

    storage_permissions = [
      "Get",
    ]
  }
}
# data "azurerm_key_vault" "keyvolt_data" {
#   name                = "kvtp21007"
#   resource_group_name = "tp2"
# }
# # is code ko chalak dekho random name generate karke dekho

# resource "random_pet" "random_username" {
#   length = 2
# }

# resource "azurerm_key_vault_secret" "username1" {
#   for_each = var.key_volt_map
#   name         = "${each.value.vm_name}-username"
#   value        = random_pet.random_username.id
#   key_vault_id = azurerm_key_vault.tp2kv[each.key].id
# }

# resource "random_password" "random_pas" {
#   for_each = var.key_volt_map
#   length           = 8
#   special          = true
#   override_special = "!#$%&*()-_=+[]{}<>:?"
# }

# resource "azurerm_key_vault_secret" "password" {
#   for_each = var.key_volt_map
#   name         = "${each.value.vm_name}-password"
#   value        = random_password.random_pas[each.key].result
#   key_vault_id = azurerm_key_vault.tp2kv[each.key].id
# }

