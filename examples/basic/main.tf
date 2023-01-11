# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project
resource "tfe_project" "regional" {
  organization = var.tfe_organization
  name         = "Regional Workspaces"
}

module "regional_workspaces" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = toset([
    "region-1",
    "region-2",
    "region-3",
  ])

  source = "./modules/terraform-tfe-regional-workspace"

  region = {
    category   = "env"
    identifier = each.key
    prefix     = "geo"
    variable   = "WORKSPACE_REGION"
  }

  project_id        = tfe_project.regional.id
  terraform_version = "1.3.7"
  tfe_organization  = var.tfe_organization

  # see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace#identifier
  vcs_repo = {
    identifier     = "ksatirli/regional-deployment-example"
    branch         = "main"
    oauth_token_id = var.tfe_oauth_client_id
  }
}
