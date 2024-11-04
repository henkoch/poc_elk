# Configure the Libvirt provider

terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.7.6"
    }
  }
}

# https://registry.terraform.io/providers/dmacvicar/libvirt/latest

# See: https://registry.terraform.io/providers/multani/libvirt/latest/docs

provider "libvirt" {
  #uri = "qemu+ssh://vmadm@homelab1/system"
  uri = "qemu:///system"
}







# Output Server IP
#output "ip" {
#  value = "${libvirt_domain.control_plane_node-vm.network_interface.0.addresses.0}"
#}

#output "worker_ip" {
#  value = "${libvirt_domain.worker_node-vm.network_interface.0.addresses.0}"
#}
