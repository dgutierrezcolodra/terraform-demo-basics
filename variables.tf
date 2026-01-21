variable "region" {
  description = "OCI region where resources will be created."
  type        = string
}

variable "tenancy_id" {
  description = "OCID of your tenancy."
  type        = string
}

variable "compartment_id" {
  description = "OCID of the compartment in which to create resources."
  type        = string
}