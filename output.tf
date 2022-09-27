output "App-server_id" {
    value = azurerm_windows_virtual_machine.App-Server.*.id
}
