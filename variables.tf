variable "allow_destroy_plan" {
  type        = bool
  description = "Whether destroy plans can be queued on the workspace."
  default     = true
}

variable "assessments_enabled" {
  type        = bool
  description = "Whether to regularly run health assessments such as drift detection on the workspace."
  default     = true
}

variable "auto_apply" {
  type        = bool
  description = "Whether to automatically apply changes when a Terraform plan is successful."
  default     = true
}

variable "execution_mode" {
  type        = string
  description = "Which execution mode to use."
  default     = "remote"
}

variable "project_id" {
  type        = string
  description = "ID of the project where the workspace should be created."
  default     = null
}

variable "region" {
  type = object({
    # Category of TFE Variable (e.g.: `env` or `terraform`)
    category = string

    # Location (e.g.: Region or Geography) Identifier
    identifier = string

    # String to use as Regional Workspace prefix (e.g.: Provider Identifier)
    prefix = string

    # Name of TFE Variable
    variable = string
  })

  description = "Object of Strings to use as Location Identifier and TFE Variable."
}

variable "structured_run_output_enabled" {
  type        = bool
  description = "Whether this workspace should show output from Terraform runs using the enhanced UI when available."
  default     = true
}

variable "terraform_version" {
  type        = string
  description = "Version of Terraform to use for Terraform Cloud."
}

variable "tfe_organization" {
  type        = string
  description = "Name of the Terraform Cloud Organization."
}

variable "vcs_repo" {
  type = object({
    identifier     = string
    branch         = string
    oauth_token_id = string
  })

  description = "VCS Repository Configuration Block."
}
