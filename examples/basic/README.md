# Example: `basic`

This is a _basic_ example of the `terraform-tfe-regional-workspace` module.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tfe_oauth_client_id | VCS Provider oAuth Client Identifier. | `string` | n/a | yes |
| tfe_organization | Name of Terraform Cloud Organization. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| tfe_project | Exported Attributes for `tfe_project`. |
| tfe_workspaces | Exported Attributes for `module.regional_workspaces.tfe_workspace`. |
<!-- END_TF_DOCS -->
