output "tfe_project" {
  description = "Exported Attributes for `tfe_project`."
  value       = tfe_project.regional
}

output "tfe_workspaces" {
  description = "Exported Attributes for `module.regional_workspaces.tfe_workspace`."
  value       = module.regional_workspaces
  sensitive   = true
}
