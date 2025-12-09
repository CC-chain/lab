output "vm_name" {
  value = proxmox_vm_qemu.this.name
}

output "vm_ip" {
  value = proxmox_vm_qemu.this.default_ipv4_address
}