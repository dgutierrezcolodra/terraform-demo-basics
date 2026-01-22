variable "region" {
  description = "OCI region where resources will be created."
  type        = string
}

variable "compartment_id" {
  description = "OCID of the compartment in which to create resources."
  type        = string
}

variable "vcn_name" {
  description = "Display name of the VCN."
  type        = string
  default     = "demo-vcn"
}

variable "vcn_cidrs" {
  description = "List of IPv4 CIDR blocks for the VCN."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_name" {
  description = "Display name for the public subnet."
  type        = string
  default     = "public-subnet"
}

variable "private_subnet_name" {
  description = "Display name for the private subnet."
  type        = string
  default     = "private-subnet"
}