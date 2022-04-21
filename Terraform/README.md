# terraform
Collection of Terraform configurations

# Usage

 - Each directory contains project files for Terraform.
   - This includes a `credentials.auto.tfvars.example` file, you'll need to change the name to `credentials.auto.tfvars` and change out the various values
 - To get started with each project, `cd` into the directory and run `terraform init` to download the necessary providers.
 - Once in, run `terraform plan` to check the configurations
   - This will tell you whether or not you will experience errors in a run, what the errors are
 - If you don't experience errors, run `terraform apply`, and watch the magic happen!