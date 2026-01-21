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

## Tips

- **Visualization**: Want to see the network graph? Run `terraform graph` and paste the output into [Graphviz Online](https://dreampuf.github.io/GraphvizOnline/).
- **Cleanup**: To delete everything, just run `terraform destroy`.

*Note: Make sure your OCI IAM policies are correctly set up if you are running this from a specific VM.*