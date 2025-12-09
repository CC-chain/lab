output "dev_control_plane_vm_name" {
  value = module.k8s_control_plane.vm_name
}

output "dev_control_plane_vm_ip" {
  value = module.k8s_control_plane.vm_ip
}

output "dev_worker_1_vm_name" {
  value = module.k8s_worker_1.vm_name
}

output "dev_worker_1_vm_ip" {
  value = module.k8s_worker_1.vm_ip
}