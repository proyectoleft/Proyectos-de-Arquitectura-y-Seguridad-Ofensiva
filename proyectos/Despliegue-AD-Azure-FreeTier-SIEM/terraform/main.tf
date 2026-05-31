terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.66.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "res-0" {
  location   = "westeurope"
  managed_by = ""
  name       = "CBN08-Cardenas"
  tags       = {}
}
resource "azurerm_windows_virtual_machine" "res-1" {
  admin_password                                         = "" # Masked sensitive attribute
  admin_username                                         = "bastionhost"
  allow_extension_operations                             = true
  automatic_updates_enabled                              = true
  availability_set_id                                    = ""
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  capacity_reservation_group_id                          = ""
  computer_name                                          = "Bastion-host"
  custom_data                                            = "" # Masked sensitive attribute
  dedicated_host_group_id                                = ""
  dedicated_host_id                                      = ""
  disk_controller_type                                   = "SCSI"
  edge_zone                                              = ""
  enable_automatic_updates                               = true
  encryption_at_host_enabled                             = false
  eviction_policy                                        = ""
  extensions_time_budget                                 = "PT1H30M"
  hotpatching_enabled                                    = false
  license_type                                           = "Windows_Client"
  location                                               = "westeurope"
  max_bid_price                                          = -1
  name                                                   = "Bastion-host"
  network_interface_ids                                  = [azurerm_network_interface.res-9.id]
  os_managed_disk_id                                     = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/CBN08-CARDENAS/providers/Microsoft.Compute/disks/Bastion-host_OsDisk_1_abbc739cffc34768afd05512613ecfb1"
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "AutomaticByOS"
  platform_fault_domain                                  = -1
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  proximity_placement_group_id                           = ""
  reboot_setting                                         = ""
  resource_group_name                                    = azurerm_resource_group.res-0.name
  secure_boot_enabled                                    = false
  size                                                   = "Standard_DC1s_v3"
  source_image_id                                        = ""
  tags                                                   = {}
  timezone                                               = ""
  user_data                                              = ""
  virtual_machine_scale_set_id                           = ""
  vm_agent_platform_updates_enabled                      = true
  vtpm_enabled                                           = false
  zone                                                   = ""
  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
  boot_diagnostics {
    storage_account_uri = ""
  }
  os_disk {
    caching                          = "ReadWrite"
    disk_encryption_set_id           = ""
    disk_size_gb                     = 127
    name                             = "Bastion-host_OsDisk_1_abbc739cffc34768afd05512613ecfb1"
    secure_vm_disk_encryption_set_id = ""
    security_encryption_type         = ""
    storage_account_type             = "Premium_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "Windows-10"
    publisher = "MicrosoftWindowsDesktop"
    sku       = "win10-22h2-ent-g2"
    version   = "latest"
  }
}
resource "azurerm_windows_virtual_machine" "res-2" {
  admin_password                                         = "" # Masked sensitive attribute
  admin_username                                         = "admin_w01"
  allow_extension_operations                             = true
  automatic_updates_enabled                              = true
  availability_set_id                                    = ""
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  capacity_reservation_group_id                          = ""
  computer_name                                          = "W01"
  custom_data                                            = "" # Masked sensitive attribute
  dedicated_host_group_id                                = ""
  dedicated_host_id                                      = ""
  disk_controller_type                                   = "SCSI"
  edge_zone                                              = ""
  enable_automatic_updates                               = true
  encryption_at_host_enabled                             = false
  eviction_policy                                        = ""
  extensions_time_budget                                 = "PT1H30M"
  hotpatching_enabled                                    = false
  license_type                                           = "Windows_Client"
  location                                               = "westeurope"
  max_bid_price                                          = -1
  name                                                   = "W01"
  network_interface_ids                                  = [azurerm_network_interface.res-11.id]
  os_managed_disk_id                                     = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/CBN08-CARDENAS/providers/Microsoft.Compute/disks/W01_OsDisk_1_5c8e162c723a4e88a49f684f982ef5bd"
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "AutomaticByOS"
  platform_fault_domain                                  = -1
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  proximity_placement_group_id                           = ""
  reboot_setting                                         = ""
  resource_group_name                                    = azurerm_resource_group.res-0.name
  secure_boot_enabled                                    = false
  size                                                   = "Standard_DC1s_v3"
  source_image_id                                        = ""
  tags                                                   = {}
  timezone                                               = ""
  user_data                                              = ""
  virtual_machine_scale_set_id                           = ""
  vm_agent_platform_updates_enabled                      = true
  vtpm_enabled                                           = false
  zone                                                   = ""
  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
  boot_diagnostics {
    storage_account_uri = ""
  }
  identity {
    identity_ids = []
    type         = "SystemAssigned"
  }
  os_disk {
    caching                          = "ReadWrite"
    disk_encryption_set_id           = ""
    disk_size_gb                     = 127
    name                             = "W01_OsDisk_1_5c8e162c723a4e88a49f684f982ef5bd"
    secure_vm_disk_encryption_set_id = ""
    security_encryption_type         = ""
    storage_account_type             = "Premium_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "Windows-10"
    publisher = "MicrosoftWindowsDesktop"
    sku       = "win10-22h2-ent-g2"
    version   = "latest"
  }
}
resource "azurerm_virtual_machine_extension" "res-3" {
  auto_upgrade_minor_version  = true
  automatic_upgrade_enabled   = false
  failure_suppression_enabled = false
  name                        = "AzureMonitorWindowsAgent"
  protected_settings          = "" # Masked sensitive attribute
  provision_after_extensions  = []
  publisher                   = "Microsoft.Azure.Monitor"
  tags                        = {}
  type                        = "AzureMonitorWindowsAgent"
  type_handler_version        = "1.0"
  virtual_machine_id          = azurerm_windows_virtual_machine.res-2.id
}
resource "azurerm_windows_virtual_machine" "res-4" {
  admin_password                                         = "" # Masked sensitive attribute
  admin_username                                         = "admin_w02"
  allow_extension_operations                             = true
  automatic_updates_enabled                              = true
  availability_set_id                                    = ""
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  capacity_reservation_group_id                          = ""
  computer_name                                          = "W02"
  custom_data                                            = "" # Masked sensitive attribute
  dedicated_host_group_id                                = ""
  dedicated_host_id                                      = ""
  disk_controller_type                                   = "SCSI"
  edge_zone                                              = ""
  enable_automatic_updates                               = true
  encryption_at_host_enabled                             = false
  eviction_policy                                        = ""
  extensions_time_budget                                 = "PT1H30M"
  hotpatching_enabled                                    = false
  license_type                                           = "Windows_Client"
  location                                               = "westeurope"
  max_bid_price                                          = -1
  name                                                   = "W02"
  network_interface_ids                                  = [azurerm_network_interface.res-13.id]
  os_managed_disk_id                                     = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/CBN08-CARDENAS/providers/Microsoft.Compute/disks/W02_OsDisk_1_85cf8c4bd0d340c8a1ba48606109562b"
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "AutomaticByOS"
  platform_fault_domain                                  = -1
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  proximity_placement_group_id                           = ""
  reboot_setting                                         = ""
  resource_group_name                                    = azurerm_resource_group.res-0.name
  secure_boot_enabled                                    = false
  size                                                   = "Standard_DC1s_v3"
  source_image_id                                        = ""
  tags                                                   = {}
  timezone                                               = ""
  user_data                                              = ""
  virtual_machine_scale_set_id                           = ""
  vm_agent_platform_updates_enabled                      = true
  vtpm_enabled                                           = false
  zone                                                   = ""
  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
  boot_diagnostics {
    storage_account_uri = ""
  }
  identity {
    identity_ids = []
    type         = "SystemAssigned"
  }
  os_disk {
    caching                          = "ReadWrite"
    disk_encryption_set_id           = ""
    disk_size_gb                     = 127
    name                             = "W02_OsDisk_1_85cf8c4bd0d340c8a1ba48606109562b"
    secure_vm_disk_encryption_set_id = ""
    security_encryption_type         = ""
    storage_account_type             = "Premium_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "Windows-10"
    publisher = "MicrosoftWindowsDesktop"
    sku       = "win10-22h2-ent-g2"
    version   = "latest"
  }
}
resource "azurerm_virtual_machine_extension" "res-5" {
  auto_upgrade_minor_version  = true
  automatic_upgrade_enabled   = false
  failure_suppression_enabled = false
  name                        = "AzureMonitorWindowsAgent"
  protected_settings          = "" # Masked sensitive attribute
  provision_after_extensions  = []
  publisher                   = "Microsoft.Azure.Monitor"
  tags                        = {}
  type                        = "AzureMonitorWindowsAgent"
  type_handler_version        = "1.0"
  virtual_machine_id          = azurerm_windows_virtual_machine.res-4.id
}
resource "azurerm_monitor_data_collection_rule" "res-6" {
  data_collection_endpoint_id = ""
  description                 = ""
  kind                        = "Windows"
  location                    = "westeurope"
  name                        = "Regla-Auditoria-WS1"
  resource_group_name         = azurerm_resource_group.res-0.name
  tags                        = {}
  data_flow {
    built_in_transform = ""
    destinations       = ["la-1239935785"]
    output_stream      = "Microsoft-Event"
    streams            = ["Microsoft-Event"]
    transform_kql      = "source"
  }
  data_sources {
    windows_event_log {
      name           = "eventLogsDataSource"
      streams        = ["Microsoft-Event"]
      x_path_queries = ["Security!*[System[(band(Keywords,13510798882111488))]]"]
    }
  }
  destinations {
    log_analytics {
      name                  = "la-1239935785"
      workspace_resource_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/CBN08-Cardenas/providers/Microsoft.OperationalInsights/workspaces/LogAnalytics-CBN08"
    }
  }
}
resource "azurerm_nat_gateway" "res-7" {
  idle_timeout_in_minutes = 4
  location                = "westeurope"
  name                    = "Nat-Gateway"
  resource_group_name     = azurerm_resource_group.res-0.name
  sku_name                = "StandardV2"
  tags                    = {}
  zones                   = ["1", "2", "3"]
}
resource "azurerm_nat_gateway_public_ip_association" "res-8" {
  nat_gateway_id       = azurerm_nat_gateway.res-7.id
  public_ip_address_id = azurerm_public_ip.res-26.id
}
resource "azurerm_network_interface" "res-9" {
  accelerated_networking_enabled = true
  auxiliary_mode                 = ""
  auxiliary_sku                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  internal_dns_name_label        = ""
  ip_forwarding_enabled          = false
  location                       = "westeurope"
  name                           = "bastion-host5"
  resource_group_name            = azurerm_resource_group.res-0.name
  tags                           = {}
  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = ""
    name                                               = "ipconfig1"
    primary                                            = true
    private_ip_address                                 = "10.0.2.4"
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = azurerm_public_ip.res-25.id
    subnet_id                                          = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/CBN08-Cardenas/providers/Microsoft.Network/virtualNetworks/VNET1/subnets/default"
  }
  depends_on = [
    # One of azurerm_subnet.res-28,azurerm_subnet_nat_gateway_association.res-29 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_network_interface_security_group_association" "res-10" {
  network_interface_id      = azurerm_network_interface.res-9.id
  network_security_group_id = azurerm_network_security_group.res-17.id
}
resource "azurerm_network_interface" "res-11" {
  accelerated_networking_enabled = true
  auxiliary_mode                 = ""
  auxiliary_sku                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  internal_dns_name_label        = ""
  ip_forwarding_enabled          = false
  location                       = "westeurope"
  name                           = "w01330"
  resource_group_name            = azurerm_resource_group.res-0.name
  tags                           = {}
  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = ""
    name                                               = "ipconfig1"
    primary                                            = true
    private_ip_address                                 = "10.0.2.10"
    private_ip_address_allocation                      = "Static"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = ""
    subnet_id                                          = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/CBN08-Cardenas/providers/Microsoft.Network/virtualNetworks/VNET1/subnets/default"
  }
  depends_on = [
    # One of azurerm_subnet.res-28,azurerm_subnet_nat_gateway_association.res-29 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_network_interface_security_group_association" "res-12" {
  network_interface_id      = azurerm_network_interface.res-11.id
  network_security_group_id = azurerm_network_security_group.res-21.id
}
resource "azurerm_network_interface" "res-13" {
  accelerated_networking_enabled = true
  auxiliary_mode                 = ""
  auxiliary_sku                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  internal_dns_name_label        = ""
  ip_forwarding_enabled          = false
  location                       = "westeurope"
  name                           = "w02328"
  resource_group_name            = azurerm_resource_group.res-0.name
  tags                           = {}
  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = ""
    name                                               = "ipconfig1"
    primary                                            = true
    private_ip_address                                 = "10.0.2.20"
    private_ip_address_allocation                      = "Static"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = ""
    subnet_id                                          = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/CBN08-Cardenas/providers/Microsoft.Network/virtualNetworks/VNET1/subnets/default"
  }
  depends_on = [
    # One of azurerm_subnet.res-28,azurerm_subnet_nat_gateway_association.res-29 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_network_interface_security_group_association" "res-14" {
  network_interface_id      = azurerm_network_interface.res-13.id
  network_security_group_id = azurerm_network_security_group.res-23.id
}
resource "azurerm_network_interface" "res-15" {
  accelerated_networking_enabled = true
  auxiliary_mode                 = ""
  auxiliary_sku                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  internal_dns_name_label        = ""
  ip_forwarding_enabled          = false
  location                       = "westeurope"
  name                           = "ws1568"
  resource_group_name            = azurerm_resource_group.res-0.name
  tags                           = {}
  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = ""
    name                                               = "ipconfig1"
    primary                                            = true
    private_ip_address                                 = "10.0.2.100"
    private_ip_address_allocation                      = "Static"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = ""
    subnet_id                                          = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/CBN08-Cardenas/providers/Microsoft.Network/virtualNetworks/VNET1/subnets/default"
  }
  depends_on = [
    # One of azurerm_subnet.res-28,azurerm_subnet_nat_gateway_association.res-29 (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_network_interface_security_group_association" "res-16" {
  network_interface_id      = azurerm_network_interface.res-15.id
  network_security_group_id = azurerm_network_security_group.res-19.id
}
resource "azurerm_network_security_group" "res-17" {
  location            = "westeurope"
  name                = "Bastion-host-nsg"
  resource_group_name = azurerm_resource_group.res-0.name
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "3389"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "RDP"
    priority                                   = 300
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
}
resource "azurerm_network_security_rule" "res-18" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "3389"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "RDP"
  network_security_group_name                = "Bastion-host-nsg"
  priority                                   = 300
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-17,
  ]
}
resource "azurerm_network_security_group" "res-19" {
  location            = "westeurope"
  name                = "NSG1"
  resource_group_name = azurerm_resource_group.res-0.name
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "3389"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "default-allow-rdp"
    priority                                   = 1000
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
}
resource "azurerm_network_security_rule" "res-20" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "3389"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "default-allow-rdp"
  network_security_group_name                = "NSG1"
  priority                                   = 1000
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-19,
  ]
}
resource "azurerm_network_security_group" "res-21" {
  location            = "westeurope"
  name                = "NSG2"
  resource_group_name = azurerm_resource_group.res-0.name
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "3389"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "default-allow-rdp"
    priority                                   = 1000
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
}
resource "azurerm_network_security_rule" "res-22" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "3389"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "default-allow-rdp"
  network_security_group_name                = "NSG2"
  priority                                   = 1000
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-21,
  ]
}
resource "azurerm_network_security_group" "res-23" {
  location            = "westeurope"
  name                = "NSG3"
  resource_group_name = azurerm_resource_group.res-0.name
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "3389"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "default-allow-rdp"
    priority                                   = 1000
    protocol                                   = "Tcp"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
}
resource "azurerm_network_security_rule" "res-24" {
  access                                     = "Allow"
  description                                = ""
  destination_address_prefix                 = "*"
  destination_address_prefixes               = []
  destination_application_security_group_ids = []
  destination_port_range                     = "3389"
  destination_port_ranges                    = []
  direction                                  = "Inbound"
  name                                       = "default-allow-rdp"
  network_security_group_name                = "NSG3"
  priority                                   = 1000
  protocol                                   = "Tcp"
  resource_group_name                        = azurerm_resource_group.res-0.name
  source_address_prefix                      = "*"
  source_address_prefixes                    = []
  source_application_security_group_ids      = []
  source_port_range                          = "*"
  source_port_ranges                         = []
  depends_on = [
    azurerm_network_security_group.res-23,
  ]
}
resource "azurerm_public_ip" "res-25" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  edge_zone               = ""
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "westeurope"
  name                    = "Bastion-host-ip"
  resource_group_name     = azurerm_resource_group.res-0.name
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = []
}
resource "azurerm_public_ip" "res-26" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  edge_zone               = ""
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "westeurope"
  name                    = "ip-publica-natgateway"
  resource_group_name     = azurerm_resource_group.res-0.name
  sku                     = "StandardV2"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = []
}
resource "azurerm_virtual_network" "res-27" {
  address_space                  = ["10.0.0.0/16"]
  bgp_community                  = ""
  dns_servers                    = []
  edge_zone                      = ""
  flow_timeout_in_minutes        = 0
  location                       = "westeurope"
  name                           = "VNET1"
  private_endpoint_vnet_policies = "Disabled"
  resource_group_name            = azurerm_resource_group.res-0.name
  subnet = [{
    address_prefixes                              = ["10.0.2.0/24"]
    default_outbound_access_enabled               = false
    delegation                                    = []
    id                                            = azurerm_subnet_nat_gateway_association.res-29.id
    name                                          = "default"
    private_endpoint_network_policies             = "Disabled"
    private_link_service_network_policies_enabled = true
    route_table_id                                = ""
    security_group                                = ""
    service_endpoint_policy_ids                   = []
    service_endpoints                             = []
  }]
  tags = {}
}
resource "azurerm_subnet" "res-28" {
  address_prefixes                              = ["10.0.2.0/24"]
  default_outbound_access_enabled               = false
  name                                          = "default"
  private_endpoint_network_policies             = "Disabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = azurerm_resource_group.res-0.name
  service_endpoint_policy_ids                   = []
  service_endpoints                             = []
  sharing_scope                                 = ""
  virtual_network_name                          = "VNET1"
  depends_on = [
    azurerm_virtual_network.res-27,
  ]
}
resource "azurerm_subnet_nat_gateway_association" "res-29" {
  nat_gateway_id = azurerm_nat_gateway.res-7.id
  subnet_id      = azurerm_subnet.res-28.id
}
resource "azurerm_log_analytics_workspace" "res-30" {
  allow_resource_only_permissions         = true
  cmk_for_query_forced                    = false
  daily_quota_gb                          = -1
  data_collection_rule_id                 = ""
  immediate_data_purge_on_30_days_enabled = false
  internet_ingestion_enabled              = true
  internet_query_enabled                  = true
  location                                = "westeurope"
  name                                    = "LogAnalytics-CBN08"
  primary_shared_key                      = "" # Masked sensitive attribute
  resource_group_name                     = azurerm_resource_group.res-0.name
  retention_in_days                       = 30
  secondary_shared_key                    = "" # Masked sensitive attribute
  sku                                     = "PerGB2018"
  tags                                    = {}
}
resource "azurerm_log_analytics_saved_search" "res-31" {
  category                   = "General Exploration"
  display_name               = "All Computers with their most recent data"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_General|AlphabeticallySortedComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-32" {
  category                   = "General Exploration"
  display_name               = "Stale Computers (data older than 24 hours)"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_General|StaleComputers"
  query                      = "search not(ObjectName == \"Advisor Metrics\" or ObjectName == \"ManagedSpace\") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName=\"Advisor Metrics\" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-33" {
  category                   = "General Exploration"
  display_name               = "Which Management Group is generating the most data points?"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_General|dataPointsPerManagementGroup"
  query                      = "search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-34" {
  category                   = "General Exploration"
  display_name               = "Distribution of data Types"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_General|dataTypeDistribution"
  query                      = "search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-35" {
  category                   = "Log Management"
  display_name               = "All Events"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|AllEvents"
  query                      = "Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-36" {
  category                   = "Log Management"
  display_name               = "All Syslogs"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|AllSyslog"
  query                      = "Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-37" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by Facility"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|AllSyslogByFacility"
  query                      = "Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-38" {
  category                   = "Log Management"
  display_name               = "All Syslog Records grouped by ProcessName"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|AllSyslogByProcessName"
  query                      = "Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-39" {
  category                   = "Log Management"
  display_name               = "All Syslog Records with Errors"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|AllSyslogsWithErrors"
  query                      = "Syslog | where SeverityLevel == \"error\" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-40" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by Client IP Address"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|AverageHTTPRequestTimeByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-41" {
  category                   = "Log Management"
  display_name               = "Average HTTP Request time by HTTP Method"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|AverageHTTPRequestTimeHTTPMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-42" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Client IP Address"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|CountIISLogEntriesClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-43" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP Request Method"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|CountIISLogEntriesHTTPRequestMethod"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-44" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by HTTP User Agent"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|CountIISLogEntriesHTTPUserAgent"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-45" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by Host requested by client"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|CountOfIISLogEntriesByHostRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-46" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL for the host \"www.contoso.com\" (replace with your own)"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|CountOfIISLogEntriesByURLForHost"
  query                      = "search csHost == \"www.contoso.com\" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost=\"www.contoso.com\" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-47" {
  category                   = "Log Management"
  display_name               = "Count of IIS Log Entries by URL requested by client (without query strings)"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|CountOfIISLogEntriesByURLRequestedByClient"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-48" {
  category                   = "Log Management"
  display_name               = "Count of Events with level \"Warning\" grouped by Event ID"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|CountOfWarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-49" {
  category                   = "Log Management"
  display_name               = "Shows breakdown of response codes"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|DisplayBreakdownRespondCodes"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-50" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Log"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|EventsByEventLog"
  query                      = "Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-51" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event Source"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|EventsByEventSource"
  query                      = "Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-52" {
  category                   = "Log Management"
  display_name               = "Count of Events grouped by Event ID"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|EventsByEventsID"
  query                      = "Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-53" {
  category                   = "Log Management"
  display_name               = "Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|EventsInOMBetween2000to3000"
  query                      = "Event | where EventLog == \"Operations Manager\" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Operations Manager\" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-54" {
  category                   = "Log Management"
  display_name               = "Count of Events containing the word \"started\" grouped by EventID"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|EventsWithStartedinEventID"
  query                      = "search in (Event) \"started\" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event \"started\" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-55" {
  category                   = "Log Management"
  display_name               = "Find the maximum time taken for each page"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|FindMaximumTimeTakenForEachPage"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-56" {
  category                   = "Log Management"
  display_name               = "IIS Log Entries for a specific client IP Address (replace with your own)"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|IISLogEntriesForClientIP"
  query                      = "search cIP == \"192.168.0.1\" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP=\"192.168.0.1\" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-57" {
  category                   = "Log Management"
  display_name               = "All IIS Log Entries"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|ListAllIISLogEntries"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-58" {
  category                   = "Log Management"
  display_name               = "How many connections to Operations Manager's SDK service by day"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|NoOfConnectionsToOMSDKService"
  query                      = "Event | where EventID == 26328 and EventLog == \"Operations Manager\" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog=\"Operations Manager\" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-59" {
  category                   = "Log Management"
  display_name               = "When did my servers initiate restart?"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|ServerRestartTime"
  query                      = "search in (Event) \"shutdown\" and EventLog == \"System\" and Source == \"User32\" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-60" {
  category                   = "Log Management"
  display_name               = "Shows which pages people are getting a 404 for"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|Show404PagesList"
  query                      = "search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-61" {
  category                   = "Log Management"
  display_name               = "Shows servers that are throwing internal server error"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|ShowServersThrowingInternalServerError"
  query                      = "search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-62" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each Azure Role Instance"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|TotalBytesReceivedByEachAzureRoleInstance"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-63" {
  category                   = "Log Management"
  display_name               = "Total Bytes received by each IIS Computer"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|TotalBytesReceivedByEachIISComputer"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-64" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by Client IP Address"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|TotalBytesRespondedToClientsByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-65" {
  category                   = "Log Management"
  display_name               = "Total Bytes responded back to clients by each IIS ServerIP Address"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-66" {
  category                   = "Log Management"
  display_name               = "Total Bytes sent by Client IP Address"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|TotalBytesSentByClientIPAddress"
  query                      = "search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-67" {
  category                   = "Log Management"
  display_name               = "All Events with level \"Warning\""
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|WarningEvents"
  query                      = "Event | where EventLevelName == \"warning\" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-68" {
  category                   = "Log Management"
  display_name               = "Windows Firewall Policy settings have changed"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|WindowsFireawallPolicySettingsChanged"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_log_analytics_saved_search" "res-69" {
  category                   = "Log Management"
  display_name               = "On which machines and how many times have Windows Firewall Policy settings changed"
  function_alias             = ""
  function_parameters        = []
  log_analytics_workspace_id = azurerm_log_analytics_workspace.res-30.id
  name                       = "LogManagement(LogAnalytics-CBN08)_LogManagement|WindowsFireawallPolicySettingsChangedByMachines"
  query                      = "Event | where EventLog == \"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog=\"Microsoft-Windows-Windows Firewall With Advanced Security/Firewall\" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122"
  tags                       = {}
}
resource "azurerm_windows_virtual_machine" "res-735" {
  admin_password                                         = "" # Masked sensitive attribute
  admin_username                                         = "administrador"
  allow_extension_operations                             = true
  automatic_updates_enabled                              = true
  availability_set_id                                    = ""
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  capacity_reservation_group_id                          = ""
  computer_name                                          = "WS1"
  custom_data                                            = "" # Masked sensitive attribute
  dedicated_host_group_id                                = ""
  dedicated_host_id                                      = ""
  disk_controller_type                                   = "SCSI"
  edge_zone                                              = ""
  enable_automatic_updates                               = true
  encryption_at_host_enabled                             = false
  eviction_policy                                        = ""
  extensions_time_budget                                 = "PT1H30M"
  hotpatching_enabled                                    = false
  license_type                                           = ""
  location                                               = "westeurope"
  max_bid_price                                          = -1
  name                                                   = "WS1"
  network_interface_ids                                  = [azurerm_network_interface.res-15.id]
  os_managed_disk_id                                     = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/CBN08-CARDENAS/providers/Microsoft.Compute/disks/WS1_OsDisk_1_f2876b28e986451faaff8fe0465c24cd"
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "AutomaticByOS"
  platform_fault_domain                                  = -1
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  proximity_placement_group_id                           = ""
  reboot_setting                                         = ""
  resource_group_name                                    = "cbn08-cardenas"
  secure_boot_enabled                                    = false
  size                                                   = "Standard_DC1s_v3"
  source_image_id                                        = ""
  tags                                                   = {}
  timezone                                               = ""
  user_data                                              = ""
  virtual_machine_scale_set_id                           = ""
  vm_agent_platform_updates_enabled                      = true
  vtpm_enabled                                           = false
  zone                                                   = ""
  additional_capabilities {
    hibernation_enabled = false
    ultra_ssd_enabled   = false
  }
  boot_diagnostics {
    storage_account_uri = ""
  }
  identity {
    identity_ids = []
    type         = "SystemAssigned"
  }
  os_disk {
    caching                          = "ReadWrite"
    disk_encryption_set_id           = ""
    disk_size_gb                     = 30
    name                             = "WS1_OsDisk_1_f2876b28e986451faaff8fe0465c24cd"
    secure_vm_disk_encryption_set_id = ""
    security_encryption_type         = ""
    storage_account_type             = "Premium_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2022-datacenter-azure-edition-smalldisk"
    version   = "latest"
  }
}
resource "azurerm_virtual_machine_extension" "res-736" {
  auto_upgrade_minor_version  = true
  automatic_upgrade_enabled   = false
  failure_suppression_enabled = false
  name                        = "AzureMonitorWindowsAgent"
  protected_settings          = "" # Masked sensitive attribute
  provision_after_extensions  = []
  publisher                   = "Microsoft.Azure.Monitor"
  tags                        = {}
  type                        = "AzureMonitorWindowsAgent"
  type_handler_version        = "1.0"
  virtual_machine_id          = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/cbn08-cardenas/providers/Microsoft.Compute/virtualMachines/ws1"
  depends_on = [
    azurerm_windows_virtual_machine.res-735,
  ]
}
