# Terraform Module: `regional-workspaces`

> Regional Workspaces Seeder for Terraform Cloud (and Enterprise)

> **Note**
>
> This module is geared towards usage within the [@workloads](https://github.com/workloads/) Organization and may have limited applicability outside of this.


## Table of Contents

<!-- TOC -->
* [Terraform Module: `regional-workspaces`](#terraform-module--regional-workspaces)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

* Terraform Cloud (or Enterprise) Account
* Terraform 1.1.x or newer.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "regional_workspaces" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = toset([
    "region-1",
    "region-2",
    "region-3",
  ])

  source  = "ksatirli/repository/tfe"
  version = "1.0.0"

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
```

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| region | Object of Strings to use as Location Identifier and TFE Variable. | <pre>object({<br>    # Category of TFE Variable (e.g.: `env` or `terraform`)<br>    category = string<br><br>    # Location (e.g.: Region or Geography) Identifier<br>    identifier = string<br><br>    # String to use as Regional Workspace prefix (e.g.: Provider Identifier)<br>    prefix = string<br><br>    # Name of TFE Variable<br>    variable = string<br>  })</pre> | n/a | yes |
| terraform_version | Version of Terraform to use for Terraform Cloud. | `string` | n/a | yes |
| tfe_organization | Name of the Terraform Cloud Organization. | `string` | n/a | yes |
| vcs_repo | VCS Repository Configuration Block. | <pre>object({<br>    identifier     = string<br>    branch         = string<br>    oauth_token_id = string<br>  })</pre> | n/a | yes |
| allow_destroy_plan | Whether destroy plans can be queued on the workspace. | `bool` | `true` | no |
| assessments_enabled | Whether to regularly run health assessments such as drift detection on the workspace. | `bool` | `true` | no |
| auto_apply | Whether to automatically apply changes when a Terraform plan is successful. | `bool` | `true` | no |
| execution_mode | Which execution mode to use. | `string` | `"remote"` | no |
| project_id | ID of the project where the workspace should be created. | `string` | `null` | no |
| structured_run_output_enabled | Whether this workspace should show output from Terraform runs using the enhanced UI when available. | `bool` | `true` | no |

### Outputs

| Name | Description |
|------|-------------|
| tfe_variable | Exported Attributes for `tfe_variable`. |
| tfe_workspace | Exported Attributes for `tfe_workspace`. |
<!-- END_TF_DOCS -->

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/terraform-tfe-regional-workspaces/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
