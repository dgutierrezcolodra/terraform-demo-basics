output "vcn_id" {
  description = "OCID of the created VCN"
  value       = module.vcn.vcn_id
}

output "public_subnet_id" {
  description = "OCID of the created public subnet"
  value       = module.vcn.subnet_id["${var.vcn_name}-public"]
}

output "private_subnet_id" {
  description = "OCID of the created private subnet"
  value       = module.vcn.subnet_id["${var.vcn_name}-private"]
}

output "internet_gateway_id" {
  description = "OCID of the Internet Gateway"
  value       = module.vcn.internet_gateway_id
}

output "nat_gateway_id" {
  description = "OCID of the NAT Gateway"
  value       = module.vcn.nat_gateway_id
}

output "service_gateway_id" {
  description = "OCID of the Service Gateway"
  value       = module.vcn.service_gateway_id
}
