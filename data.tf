data "azurerm_client_config" "tanant_block" {}

variable "key_volt_map" {
    type = map(any)
  
}