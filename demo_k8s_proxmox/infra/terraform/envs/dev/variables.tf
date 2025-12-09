variable "pm_api_url" { type = string }
variable "pm_api_token_id" {
  type      = string
  sensitive = true
}
variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}
variable "proxmox_node" { type = string }
variable "vm_template" { type = string }
variable "vm_storage" { type = string }
variable "vm_bridge" { type = string }
variable "ssh_public_key" { type = string }
variable "vm_network_id" { type = number }
