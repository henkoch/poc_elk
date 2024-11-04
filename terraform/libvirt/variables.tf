variable ansible_ssh_public_key_filename {
  type        = string
  description = "Location of ansible SSH public key file."
  default = "./private_ansible_cloud_init.pub"
}

variable discovery_token {
  type        = string
  description = "discovery token, used by worker join"
  default = ""
}

variable discovery_token_ca_cert_hash {
  type        = string
  description = "hash for validating that the root CA public key is valid, used by worker join"
  default = ""
}

variable vm_image_source {
  type        = string
  description = "image source to used for the VMs"
  default = "/var/ubuntu_jammy_cloudimg.qcow2"
}

variable kubernetes_version {
  type        = string
  description = "kubernetes version to deploy"
  default = "v1.29"
}

variable project_tag {
  type        = string
  description = "tag used in front on the VMs"
  default = "lfs"
}

variable worker_node_count {
  type        = number
  description = "number of worker nodes"
  default = 2
}

variable control_plane_node_count {
  type        = number
  description = "number of control plane nodes"
  default = 3
}

variable load_balancer_dns {
  type        = string
  description = "DNS name for the load balancer"
  default = "YOU_MUST_CHANGE_THE_LOAD_BALANCER_DNS_NAME"
  
}