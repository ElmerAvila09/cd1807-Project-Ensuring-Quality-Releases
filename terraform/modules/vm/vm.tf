resource "azurerm_network_interface" "test_nic" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}

resource "azurerm_linux_virtual_machine" "test_vm" {
  name                = "${var.application_type}-VM"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_DS2_v2"
  admin_username      = "adminuser"
  network_interface_ids = [azurerm_network_interface.test_nic.id]
  source_image_id       = "/subscriptions/c9f1e8cb-24a3-405b-9046-bf2b34125d0c/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDtldszwtjfEMgZaq7x3ACyWgLVptG9V7W+VbGQcfPZz3RnUvq6uEIoNcvRjbFADqlnL5rbVDPlGKsLy8C6Ts/qSw7zz7YcLuoaDfbdL7zvv/aWZ5OfSoPUn8R89Uu/rez2p/R+NiQ+zZHOGQnwqzmg65lRchL7Okx9ar7LCTyKVn5jyAMsxuNcAy6aLP1fwXpbucn+lHy53iix6gS/UyckESwaUIZACwE/TFc7+RbmrnITd1f7nczQBwXU9S3CvwBUBFgP6c/NUIj1vZV1bV9VrWSvOiYG1c/ZQXmOY7nJuCtzoULNQK/n1BRQ8n4mljbm4w8YMYxl21U0tvh59R3vH+NPmnb5SAB4UKbndtGPcyusBAT1wcQpE+izE8wM8LIFx4J1iIoMqIpRdlZW79ZAs8jmWeUhO2u4kr59Bez+rEX6PSUhjtda3WpOD7iSG7K+f0/MWA6ECipDi7yW/9RXPrDPwbYp7YCmqMUHaDCYENrR1RJI1dmH564otD0rZX0= odl_user@SandboxHost-638405027241533819"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
/*   source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  } */
}
