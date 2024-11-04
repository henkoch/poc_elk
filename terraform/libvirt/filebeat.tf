# ------------------------------------ LAB CLIENT

data "template_file" "elk_user_data" {
  template = file("./cloud-init-actions.yaml")

  # left hand var names are the var names used in the cloud-init yaml.
  vars = {
    ansible_ssh_public_key = file(var.ansible_ssh_public_key_filename)
    # TODO also copy the private key, for access to the nodes
    node_type = "ansible"
    vm_hostname = "elk"
    ansible_playbook_file_base64 = filebase64("ansible_playbook/ansible_telemetry_playbook.yaml")
    ansible_file_filebeat_yaml_base64 = filebase64("ansible_playbook/files/filebeat.yml")
    ansible_file_logstash_conf_base64 = filebase64("ansible_playbook/files/logstash.conf")
    ansible_file_logstash_yaml_base64 = filebase64("ansible_playbook/files/logstash.yml")
    ansible_file_elasticsearch_yaml_base64 = filebase64("ansible_playbook/files/elasticsearch.yml")
    ansible_file_kibana_yaml_base64 = filebase64("ansible_playbook/files/kibana.yml")
  }
}

resource "libvirt_cloudinit_disk" "elk_commoninit" {
  name      = "filebeat_commoninit.iso"
  user_data = data.template_file.elk_user_data.rendered
}

# Defining VM Volume
resource "libvirt_volume" "elk_node_os-qcow2" {
  name = "filebeat.qcow2"
  pool = "default" # List storage pools using virsh pool-list
  source = "${var.vm_image_source}"
  format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "elk_node-vm" {
  name   = "filebeat_vm"
  memory = "4096"
  vcpu   = 2

  cloudinit = libvirt_cloudinit_disk.elk_commoninit.id

  network_interface {
    network_name = "default" # List networks with virsh net-list
    bridge = "virbr0"
    wait_for_lease = true
  }

  disk {
    volume_id = "${libvirt_volume.elk_node_os-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

output "filebeat_ip" {
  value = "${libvirt_domain.elk_node-vm.network_interface.0.addresses.0}"
}
