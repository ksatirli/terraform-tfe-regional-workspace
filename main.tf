# creating workspaces within a loop is not a common practice
# read and understand the following code before applying this pattern to your project(s)
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "main" {
  name                          = "regional-${var.region.prefix}-${var.region.identifier}"
  organization                  = var.tfe_organization
  description                   = "Regional Workspace for Provider `${var.region.prefix}` in Region `${var.region.identifier}`."
  assessments_enabled           = var.assessments_enabled
  allow_destroy_plan            = var.allow_destroy_plan
  auto_apply                    = var.auto_apply
  execution_mode                = "remote"
  project_id                    = var.project_id
  structured_run_output_enabled = var.structured_run_output_enabled

  tag_names = [
    "provider:${var.region.prefix}",
    "region:${var.region.identifier}",
    "regional-provider:${var.region.prefix}",
  ]

  terraform_version = var.terraform_version

  vcs_repo {
    identifier     = var.vcs_repo.identifier
    branch         = var.vcs_repo.branch
    oauth_token_id = var.vcs_repo.oauth_token_id
  }
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "region" {
  key          = var.region.variable
  value        = var.region.identifier
  category     = var.region.category
  description  = "String of Provider-specific Location (Region / Geography) Identifier for this Workspace."
  sensitive    = false
  workspace_id = tfe_workspace.main.id
}
