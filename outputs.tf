output "vcn_id" {
  description = "OCID of the created VCN"
  value       = module.vcn.vcn_id
}

output "public_subnet_id" {
  description = "OCID of the created public subnet"
  value       = module.vcn.subnet_id[0]
}
