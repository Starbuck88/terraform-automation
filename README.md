# Terraform Automation Project

This project uses Terraform to manage a simple feature flag stored in AWS Systems Manager (SSM) Parameter Store.

## Prerequisites

* An AWS account
* Terraform CLI installed
* AWS CLI installed and configured with valid credentials

## Usage

1.  **Initialize Terraform**:
    ```bash
    terraform init
    ```

2.  **Plan Changes**:
    ```bash
    terraform plan
    ```

3.  **Apply Changes**:
    ```bash
    terraform apply
    ```

You can change the default parameter name and value by editing the `variables.tf` file.
