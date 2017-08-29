provider "ibm" {
  bluemix_api_key = "${var.bxapikey}"
  softlayer_username = "${var.slusername}"
  softlayer_api_key = "${var.slapikey}"
}

# Create a new virtual guest using image "Debian"
# Your VM will appear with hostname starting with "terraformed-"
resource "ibm_compute_vm_instance" "terraform-sample-ruusnak" {
   hostname = "terraform-sample-ruusnak"
   domain = "jr.example.com"
   datacenter = "ams01"
   public_network_speed = 10
   hourly_billing = false
   cores = 1
   memory = 1024
   local_disk = false
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
  value = "${ibm_compute_vm_instance.id}"
}
