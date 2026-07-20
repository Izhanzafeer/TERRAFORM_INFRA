# Terraform Infrastructure

## Overview

This repository contains Terraform Infrastructure as Code (IaC) for deploying and managing Azure Landing Zone resources across multiple environments. The infrastructure follows a modular approach, enabling reusable Terraform modules and environment-specific configurations.

---

## Repository Structure

```
TERRAFORM_INFRA/
│
├── .github/
│   └── workflows/
│       ├── terraform-deploy.yml
│       └── terraform-destroy.yml
│
├── envs/
│   ├── firewall-rules/
│   ├── hub/
│   ├── hub-dr/
│   ├── production/
│   ├── production-dr/
│   └── security/
│
├── modules/
│   ├── application-gateway/
│   ├── bastion/
│   ├── diagnostic-settings/
│   ├── firewall/
│   ├── key-vault/
│   ├── local-network-gateway/
│   ├── log-analytics/
│   ├── network-security-group/
│   ├── public-ip-address/
│   ├── recovery-services-vault/
│   ├── resource-group/
│   ├── route-table/
│   ├── storage-account/
│   ├── subnet/
│   ├── virtual-network/
│   ├── virtual-network-gateway/
│   └── vpn-connection/
│
├── .gitignore
└── README.md
```

---

## Prerequisites

Ensure the following tools are installed before deploying the infrastructure.

- Terraform v1.5.0 or later
- Azure CLI
- Git
- Visual Studio Code (Recommended)

---

## Azure Authentication

Login to Azure.

```bash
az login
```

Select the appropriate subscription.

```bash
az account set --subscription "<Subscription-ID>"
```

Verify the selected subscription.

```bash
az account show
```

---

## Terraform Workflow

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Format Terraform Files

```bash
terraform fmt -recursive
```

### Preview Changes

```bash
terraform plan -out=tfplan
```

### Deploy Infrastructure

```bash
terraform apply tfplan
```

or

```bash
terraform apply
```

---

## Destroy Infrastructure

Preview resources to be deleted.

```bash
terraform plan -destroy
```

Destroy resources.

```bash
terraform destroy
```

---

## Environment Deployment

Navigate to the required environment before running Terraform.

Example:

```bash
cd envs/hub
terraform init
terraform plan
terraform apply
```

Similarly,

```
envs/hub-dr
envs/production
envs/production-dr
envs/security
envs/firewall-rules
```

can be deployed independently.

---

## Modules

The infrastructure uses reusable Terraform modules.

Examples include:

- Resource Group
- Virtual Network
- Subnet
- Network Security Group
- Route Table
- Public IP Address
- Azure Firewall
- Azure Bastion
- Log Analytics Workspace
- Key Vault
- Storage Account
- Recovery Services Vault
- VPN Gateway
- Local Network Gateway
- VPN Connection
- Diagnostic Settings
- Application Gateway

Each module contains:

- main.tf
- variables.tf
- outputs.tf

---

## GitHub Workflows

The repository contains GitHub Actions workflows for infrastructure automation.

### terraform-deploy.yml

- Terraform Init
- Terraform Validate
- Terraform Plan
- Terraform Apply

### terraform-destroy.yml

- Terraform Destroy

---

## Best Practices

- Use reusable modules wherever possible.
- Store Terraform state remotely.
- Do not commit Terraform state files.
- Keep environment configurations isolated.
- Validate Terraform before deployment.
- Review the execution plan before applying changes.

---

## Notes

- Environment-specific values should be maintained in `terraform.tfvars`.
- Sensitive information should never be committed to the repository.
- Follow Azure naming conventions and tagging standards.
- Ensure the correct Azure subscription is selected before deployment.

---

## Author

Terraform Infrastructure Repository

Infrastructure as Code (IaC) using Terraform for Microsoft Azure.