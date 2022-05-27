# terraform
Collection of Terraform configurations

# Usage

 - Each directory contains project files for Terraform.
   - This includes a `credentials.auto.tfvars.example` file, you'll need to change the name to `credentials.auto.tfvars` and change out the various values
 - To get started with each project, `cd` into the directory and run `terraform init` to download the necessary providers.
 - Once in, run `terraform plan` to check the configurations
   - This will tell you whether or not you will experience errors in a run, what the errors are
 - If you don't experience errors, run `terraform apply`, and watch the magic happen!

# Deploying from Terraform Cloud

If you would like to have your deployments performed from Hashicorp's [Terraform Cloud](https://app.terraform.io), you will need to log into Terraform Cloud via the CLI.

You can do this by running:

```bash
terraform login
```

And login with the prompts that follow.


In order to push deployments to Terraform Cloud with local files, you will need to:
 - Rename this file to `terraformCloud.tf`
 - Make sure you have an account in Terraform Cloud, and you will be able to fill in the information

If the directory doesn't contain this file, here is a template:

```tf
terraform {
    cloud {
        organization = "YourOrg"
            workspaces {
                name = "name-of-your-workspace"
        }
    }
}
```