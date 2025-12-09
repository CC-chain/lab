variable "env_name" {type = string}
variable "proxmox_node" {type = string}
variable "vm_template" {type = string}
variable "vm_storage" {type = string}
variable "vm_bridge" {type = string}
variable "vm_cpu" {
type = number
default= 2
}
variable "vm_memory" {
  type = number
  default     = 4096
}
variable "disk_size" {
  type = number
  default = 10
}
variable "ssh_public_key" {type = string}
variable "vm_network_id" {type = number}
variable "ip_address" {type = string}
variable "node_name" {type = string}