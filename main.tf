provider "ibm" {
  bluemix_api_key = "${var.bxapikey}"
  softlayer_username = "${var.slusername}"
  softlayer_api_key = "${var.slapikey}"
}

# Create a new virtual guest using image "Debian"
# Your VM will appear with hostname starting with "terraformed-"
resource "ibmcloud_infra_virtual_guest" "debian_small_virtual_guest" {
  os_reference_code        = "DEBIAN_7_64"
  domain                   = "myapp.ibm.com"
  datacenter               = "${var.datacenter}"
  network_speed            = 100
  hourly_billing           = true
  private_network_only     = true
  cores                    = 1
  memory                   = 1024
  disks                    = [25, 10, 20]
  user_metadata            = "{\"value\":\"newvalue\"}"
  local_disk               = false
}

##############################################################################
# Variables
##############################################################################
variable bxapikey {
  description = "Your Bluemix API Key."
}
variable slusername {
  description = "Your Softlayer username."
}
variable slapikey {
  description = "Your Softlayer API Key."
}
variable datacenter {
  description = "The datacenter to create resources in."
}

##############################################################################
# Outputs
##############################################################################
output "VM_id" {
  value = "${ibmcloud_infra_virtual_guest.id}"
}
