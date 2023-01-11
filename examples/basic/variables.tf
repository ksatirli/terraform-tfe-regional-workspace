variable "tfe_organization" {
  type        = string
  description = "Name of Terraform Cloud Organization."
  default     = "a-demo-organization"
}

variable "tfe_oauth_client_id" {
  type        = string
  description = "VCS Provider oAuth Client Identifier."
  sensitive   = true
}
