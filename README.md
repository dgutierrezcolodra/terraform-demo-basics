# OCI Networking with Terraform

This project sets up a professional, two-tier network on Oracle Cloud (OCI). It's designed to be simple to deploy while following security best practices.

## What's inside?

I've configured this to build a complete network environment:
- **Two-tier setup**: Includes both Public and Private subnets.
- **Full Connectivity**: Comes with Internet, NAT, and Service Gateways pre-configured.
- **Secure by default**: Private resources can reach the internet for updates, but nobody can reach them from the outside.
- **Remote State**: Your Terraform state is stored securely in an OCI Object Storage bucket (`terraform-demo-bucket`).
- **No Keys Needed**: It uses `InstancePrincipal` authentication, so it works out-of-the-box in OCI Cloud Shell or authorized OCI VMs.

## Quick Start

### 1. Set your variables
Copy the example file and fill in your OCIDs. You can also customize the network names and CIDR blocks here.

```bash
cp terraform.tfvars.example terraform.tfvars
nano terraform.tfvars
```

### 2. Initialize & Plan
Since this uses the native OCI backend, make sure you're using Terraform v1.12 or higher.

```bash
terraform init
terraform plan -out=deploy.plan
```

### 3. Deploy
Review the plan and apply it when ready.

```bash
terraform apply deploy.plan
```

## Special Feature: Drift Detection 🛡️

Terraform automatically tracks manual changes made in the OCI Console.
- **Try it out**: Rename a subnet or the VCN in the OCI Console manually.
- **Detection**: Run `terraform plan` and see Terraform detect the "drift". 
- **Option A: Revert**: Run `terraform apply` to automatically undo the manual change and restore the name defined in your code.
- **Option B: Accept & Sync**: If the change was intentional, update your code (or `terraform.tfvars`) to match the new name. Then run `terraform plan` to confirm your code and the cloud are in sync again.

*(Note: Tags are ignored by design in this module to avoid conflicts with OCI default policies).*

## Tips

- **Visualization**: Want to see the network graph? Run `terraform graph` and paste the output into [Graphviz Online](https://dreampuf.github.io/GraphvizOnline/).
- **Cleanup**: To delete everything, just run `terraform destroy`.

---
*Make sure your OCI IAM policies are correctly set up as described in the [Walkthrough](.gemini/antigravity/brain/23125761-10be-40f0-84e4-01a2e05db06e/walkthrough.md).*