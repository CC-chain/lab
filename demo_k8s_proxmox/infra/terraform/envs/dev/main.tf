locals {
  env_name          = "dev"
  control_plane_ips = ["192.168.1.162"]
  worker_ips        = ["192.168.1.163"]
  ansible_inventory_path = "${path.module}/../../../ansible/inventories/dev.ini" 
}


module "k8s_control_plane" {
  source = "../../modules/proxmox-vm"

  env_name       = local.env_name
  node_name      = "control-plane"
  proxmox_node   = var.proxmox_node
  vm_template    = var.vm_template
  vm_storage     = var.vm_storage
  vm_bridge      = var.vm_bridge
  ssh_public_key = var.ssh_public_key
  vm_network_id = var.vm_network_id

  vm_cpu    = 4
  vm_memory = 8192
  disk_size = 30

  ip_address = local.control_plane_ips[0]
}

module "k8s_worker_1" {
  source = "../../modules/proxmox-vm"

  env_name       = local.env_name
  node_name      = "worker-1"
  proxmox_node   = var.proxmox_node
  vm_template    = var.vm_template
  vm_storage     = var.vm_storage
  vm_bridge      = var.vm_bridge
  ssh_public_key = var.ssh_public_key
  vm_network_id = var.vm_network_id

  vm_cpu    = 4
  vm_memory = 8192
  disk_size = 30

  ip_address = local.worker_ips[0]
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/../../templates/ansible_inventory.ini.tmpl", {
    env_name          = local.env_name
    control_plane_ips = local.control_plane_ips
    worker_ips        = local.worker_ips
    ssh_user          = "ubuntu"
    ssh_key           = "/home/ubuntu/.ssh/proxmox-k8s"
  })

  filename = local.ansible_inventory_path
}