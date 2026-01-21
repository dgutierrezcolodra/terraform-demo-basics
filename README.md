# OCI VCN Module Demo

This repository contains a minimal **Terraform** configuration that uses the
official [`terraform-oci-vcn`](https://github.com/oracle-terraform-modules/terraform-oci-vcn)
module to provision a **Virtual Cloud Network (VCN)** with one public
subnet in **Oracle Cloud Infrastructure (OCI)**.  It is designed to be run
from **OCI Cloud Shell** using instance principal authentication, which
avoids the need to configure API keys or an OCI CLI profile.

## Features

- Provisions a VCN with a customizable CIDR block and associates a public
  subnet.
- Creates an **Internet Gateway** and updates the route table so that
  instances in the public subnet have outbound internet access.
- Uses the **native OCI backend** for state management, stored in an OCI Object
  Storage bucket (`terraform-demo-basics`) with versioning enabled.
- Designed to run in OCI Cloud Shell using current user credentials.

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
terraform plan -out=plan.tfplan
```

### 4.5. Visualize dependencies (Optional)

You can generate a visual representation of the resource dependencies to show to your
client. This requires `Graphviz` installed:

```bash
terraform graph | dot -Tpng > graph.png
```

If you don't have Graphviz, you can paste the output of `terraform graph` into
[Graphviz Online](https://dreampuf.github.io/GraphvizOnline/).

### 5. Apply the configuration

Apply the configuration using the plan file created in the previous step. Note that
when using a plan file, Terraform will not prompt for confirmation:

```bash
terraform apply plan.tfplan
```

### 6. (Optional) Destroy the environment

When finished, you can destroy all resources created by this demo:

```bash
terraform destroy
```

## Notes

- The **VCN** module can create additional networking components—such as NAT
  gateways, service gateways and local peering gateways—by adjusting the
  variables.  See the [module documentation](https://github.com/oracle-terraform-modules/terraform-oci-vcn) for details.
- Running this demo in **Cloud Shell** takes advantage of instance principal
  authentication; you do not need to manage API keys.
- Make sure that your tenancy and compartment IDs correspond to a region
  where you have permission to create network resources.