variable "name" {
  description = "Name of the NSG"
  type        = string
}

variable "location" {
  description = "Location of the NSG"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "rules" {
  description = "List of rules to apply to the NSG"
  type = list(object({
    name                        = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
  }))
}
