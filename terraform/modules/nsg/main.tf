resource "azurerm_network_security_group" "nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "rule" {
  count                       = length(var.rules)
  name                        = var.rules[count.index].name
  priority                    = var.rules[count.index].priority
  direction                   = var.rules[count.index].direction
  access                      = var.rules[count.index].access
  protocol                    = var.rules[count.index].protocol
  source_port_range           = var.rules[count.index].source_port_range
  destination_port_range      = var.rules[count.index].destination_port_range
  source_address_prefix       = var.rules[count.index].source_address_prefix
  destination_address_prefix  = var.rules[count.index].destination_address_prefix
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.resource_group_name
}
