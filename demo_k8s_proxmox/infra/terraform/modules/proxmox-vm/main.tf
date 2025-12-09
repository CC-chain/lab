locals {
  vm_name = "k8s-${var.env_name}-${var.node_name}"
}

resource "proxmox_vm_qemu" "this" {
  name        = local.vm_name
  target_node = var.proxmox_node
  clone       = var.vm_template
  agent   = 1
  cores   = var.vm_cpu
  sockets = 1
  memory  = var.vm_memory
  scsihw  = "virtio-scsi-pci"
  bootdisk = "scsi0"

  ipconfig0 = "ip=${var.ip_address}/24,gw=192.168.1.1"

  disk {
    size    = "${var.disk_size}G"
    slot    = "scsi0"
    storage = var.vm_storage
    type    = "disk"
  }

  os_type =  "cloud-init"
  ciuser  = "ubuntu"
  sshkeys = var.ssh_public_key
  
  disk {
    slot    = "ide2"
    type    = "cloudinit"
    storage = var.vm_storage
  }

  network {
    id     = var.vm_network_id
    model  =  "virtio"
    bridge = var.vm_bridge
  }

   onboot = true
}