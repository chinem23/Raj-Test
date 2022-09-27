resource "azurerm_network_interface" "MAO-NIC" {
  count               = var.app_server_count
  name                = "${var.NIC_name}-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "App-Server" {
  count               = var.app_server_count
  name                = "${var.App-server_name}-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.MAO-NIC[count.index].id
  ]
 
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}