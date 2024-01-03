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
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDH7djW1diX1uAJADMdvzvCXAi25vy+pOp0EUZa0+WNgYsPLNm0EjBdf5fIgoP70aOGglayLFDsdKYbdg/sxoYB3dZ9DCi5LI8YZXbTzrWOq+biHeQaZm1HzycLDuBVtFz7KEMwpM62WHwEAwsIewn7vnDcu8sqgRXMrHj5dQB/fHZMoc1i0wgZ2wMlY8GzT1kzE7CKe4fkPUR+oQBH+KjlMtOY8IJs6DpGN0fJN8RPHSyTdz7rDHXWHL4If+LmMQtva/fALbzGVqkTFkLOaSwxthp5EuBK5w+4zsfU7xF+tsH+fnnAMW9Ofl5gCSyqvZw/NBMos+DYguR6XdbBrIpApVcPQIslTGi0raDq3S2x+KcfPlbeWovLrajQSYqBzVzcCpjQXYJX7GVO95jAX/Qfk5eS9ihiXom4h1kRjSvIriIjr/7JCayTcZ+gjPGXXxUSeNl6rI1vRmIkGBdKkHmFXRPn6Vo2FNqzmk39k1H/iafoy70TriCedrkKvG1He5s= odl_user@SandboxHost-638366887482295031"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
