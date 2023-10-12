output "tfe_workspace" {
  description = "Exported Attributes for `tfe_workspace`."
  value       = tfe_workspace.main
}

output "tfe_variable_region" {
  description = "Exported Attributes for `tfe_variable.region`."
  value       = tfe_variable.region
}

output "tfe_variable_workspace" {
  description = "Exported Attributes for `tfe_variable.workspace`."
  value       = tfe_variable.workspace
}
