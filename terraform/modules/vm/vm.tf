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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLuBfgsSSGu9rZduyilIgD4atN680tinbFouqcVvFAT/Wdbw17LI/uVx8OX0rZvTKbNzRm4qxgQ2IqTRvX0MLgucnBV7lEDVfL/V20izrkI9+WfHOGB6E7ZrlCm2Wy93xS/hLdxN2/P2khUo9nZQ6yBXmsDfV9o3UR+eFIvsym6St/qRUh2mMzONggu5PL9U8N3Bf4M/nknicOUZI7me29yVoL4E0Xyzju1t3IzZZE0JRUz0R5QzbRPopto3cZUZW7ZCyMzu6ymTAZKrPUQq92oBLq+5dtboPuXLPBguuFWX1aOIDOF9EXxb7yISJzRVnmwOITCwEwuCNThG/nuogPzU4HKjxHc52y+RZeilORb+PfZkVPnyUOEqpnWRplzLQ5Fg08jNuvYsbz0rWaw03U6ztRKY2dgGQuJh7bL1ovUurJyqBorFRDGVvppe5HWsjw8mkSL0r6Yi+iPody8Ly193Zex94+KAYJhiveCjuWQEbbK6eF02/jYG8YuXwayxU= odl_user@SandboxHost-638404187256337228"
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
