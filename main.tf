module "vcn" {
  # Use the official Oracle Terraform module to create a Virtual Cloud Network
  # https://github.com/oracle-terraform-modules/terraform-oci-vcn
  source = "github.com/oracle-terraform-modules/terraform-oci-vcn?ref=v3.6.0"

  compartment_id = var.compartment_id

  # Prefix that will be prepended to resource names
  label_prefix = "demo"

  # Name of the VCN
  vcn_name = var.vcn_name

  # VCN CIDR blocks
  vcn_cidrs = var.vcn_cidrs

  # Gateways configuration
  create_internet_gateway = true
  create_nat_gateway      = true
  create_service_gateway  = true

  # Define subnets
  subnets = {
    public_subnet = {
      cidr_block = var.public_subnet_cidr
      type       = "public"
      name       = var.public_subnet_name
    }
    private_subnet = {
      cidr_block = var.private_subnet_cidr
      type       = "private"
      name       = var.private_subnet_name
    }
  }
}