terraform {
  backend "s3" {
    bucket   = "terraform-demo-basics"
    key      = "terraform.tfstate"
    region   = "eu-frankfurt-1"
    endpoint = "https://frctnpsoobr3.compat.objectstorage.eu-frankfurt-1.oraclecloud.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
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