terraform {
  backend "oci" {
    bucket    = "terraform-demo-basics"
    namespace = "frctnpsoobr3"
    region    = "eu-frankfurt-1"
    key       = "terraform.tfstate"
  }
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.30.0"
    }
  }
}

provider "oci" {
  region = var.region
}