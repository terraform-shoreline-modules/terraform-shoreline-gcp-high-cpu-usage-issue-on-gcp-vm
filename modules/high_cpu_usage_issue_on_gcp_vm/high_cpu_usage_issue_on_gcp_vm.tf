resource "shoreline_notebook" "high_cpu_usage_issue_on_gcp_vm" {
  name       = "high_cpu_usage_issue_on_gcp_vm"
  data       = file("${path.module}/data/high_cpu_usage_issue_on_gcp_vm.json")
  depends_on = [shoreline_action.invoke_upgrade_vm_types]
}

resource "shoreline_file" "upgrade_vm_types" {
  name             = "upgrade_vm_types"
  input_file       = "${path.module}/data/upgrade_vm_types.sh"
  md5              = filemd5("${path.module}/data/upgrade_vm_types.sh")
  description      = "Upgrade the VM instance type to one with more CPU cores, memory, or storage capacity to handle the workload."
  destination_path = "/agent/scripts/upgrade_vm_types.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_upgrade_vm_types" {
  name        = "invoke_upgrade_vm_types"
  description = "Upgrade the VM instance type to one with more CPU cores, memory, or storage capacity to handle the workload."
  command     = "`chmod +x /agent/scripts/upgrade_vm_types.sh && /agent/scripts/upgrade_vm_types.sh`"
  params      = ["NAME_OF_YOUR_VM","NEW_MACHINE_TYPE","INSTANCE_NAME","ZONE_OF_YOUR_VM","YOUR_PROJECT_ID"]
  file_deps   = ["upgrade_vm_types"]
  enabled     = true
  depends_on  = [shoreline_file.upgrade_vm_types]
}

