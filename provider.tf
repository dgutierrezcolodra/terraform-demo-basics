terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      # Pin the provider version to avoid unexpected upgrades.  Adjust as needed.
      version = ">= 4.0"
    }
  }
}

provider "oci" {
  # Use instance principal authentication in Cloud Shell so no API keys are needed
  auth   = "InstancePrincipal"
  region = var.region
}