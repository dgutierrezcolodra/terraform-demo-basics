terraform {
  backend "oci" {
    auth         = "InstancePrincipal"
    bucket       = "terraform-demo-bucket"
    namespace    = "frctnpsoobr3"
    region       = "eu-frankfurt-1"
    key          = "dev/terraform.tfstate"
    tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaacgomiinzmfduoro47jiq5byg2urp7rk7wgxs74gfqczvj6yau3sq"
  }
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.30.0"
    }
  }
}

provider "oci" {
  auth   = "InstancePrincipal"
  region = var.region
}
