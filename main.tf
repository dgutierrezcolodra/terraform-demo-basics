module "vcn" {
  # Use the official Oracle Terraform module to create a Virtual Cloud Network
  # https://github.com/oracle-terraform-modules/terraform-oci-vcn
  source  = "github.com/oracle-terraform-modules/terraform-oci-vcn"

  tenancy_id     = var.tenancy_id
  compartment_id = var.compartment_id

  # Prefix that will be prepended to resource names
  label_prefix = "demo"
  # Name of the VCN appended to the prefix
  vcn_name     = "demo-vcn"

  # Create an internet gateway and a public subnet to allow outbound access
  create_internet_gateway = true

  # Define a single public subnet.  The module uses the map keys as
  # identifiers when naming the subnets.  If additional subnets are needed,
  # duplicate the block with different CIDRs and names.
  subnets = {
    public_subnet = {
      cidr_block = "10.0.1.0/24"
      type       = "public"
      name       = "demo-public"
    }
  }
}