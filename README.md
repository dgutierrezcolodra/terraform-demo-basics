# OCI VCN Module Demo

This repository contains a minimal **Terraform** configuration that uses the
official [`terraform-oci-vcn`](https://github.com/oracle-terraform-modules/terraform-oci-vcn)
module to provision a **Virtual Cloud Network (VCN)** with one public
subnet in **Oracle Cloud Infrastructure (OCI)**.  It is designed to be run
from **OCI Cloud Shell** using instance principal authentication, which
avoids the need to configure API keys or an OCI CLI profile【505789648476797†L45-L54】.

## Features

- Provisions a VCN with a customizable CIDR block and associates a public
  subnet【961716393103386†L2-L13】.
- Creates an **Internet Gateway** and updates the route table so that
  instances in the public subnet have outbound internet access.
- Uses sensible defaults and a simple variable interface so that newcomers
  can get started quickly.  The underlying module can also create NAT
  gateways, service gateways and additional subnets when configured【961716393103386†L2-L13】.
- Designed to run in OCI Cloud Shell; authentication is handled by
  instance principals automatically【505789648476797†L45-L54】.

## Files

- `provider.tf` – declares the OCI provider and sets the region.
- `variables.tf` – defines input variables (`region`, `tenancy_id`, `compartment_id`).
- `main.tf` – calls the VCN module and defines a single public subnet.
- `terraform.tfvars.example` – sample variable file; copy to `terraform.tfvars`
  and substitute your own OCIDs.

## Usage

### 1. Clone the repository in OCI Cloud Shell

Open Cloud Shell from the OCI console and run:

```bash
git clone <this-repo-url>
cd terraform-demo
```

### 2. Configure your variables

Copy the example variables file and edit it with your tenancy and compartment IDs
and region:

```bash
cp terraform.tfvars.example terraform.tfvars
vi terraform.tfvars
```

### 3. Initialise the working directory

Initialise Terraform to download the OCI provider and the VCN module:

```bash
terraform init
```

### 4. Preview the changes

Run a plan to review the resources that will be created:

```bash
terraform plan
```

### 5. Apply the configuration

Apply the configuration to create the VCN and subnet.  Terraform will prompt
for confirmation before proceeding:

```bash
terraform apply
```

### 6. (Optional) Destroy the environment

When finished, you can destroy all resources created by this demo:

```bash
terraform destroy
```

## Notes

- The **VCN** module can create additional networking components—such as NAT
  gateways, service gateways and local peering gateways—by adjusting the
  variables.  See the [module documentation](https://github.com/oracle-terraform-modules/terraform-oci-vcn) for details【961716393103386†L2-L13】.
- Running this demo in **Cloud Shell** takes advantage of instance principal
  authentication; you do not need to manage API keys【505789648476797†L45-L54】.
- Make sure that your tenancy and compartment IDs correspond to a region
  where you have permission to create network resources.