# Terraform - Harvester

Set of configuration examples for Terraform Harvester HCI integration.


### Side Note

Authentication is a bit obscure in the provider documentation, configuration schema listed for the Terraform provider shows the ability to use a `kubeconfig`, which can be provided by Harvester.


# Getting Started

## Get Harvester Kubeconfig

### From the Harvester dashboard

 - Click `Support` on the bottom-left of the screen
 - Click the `Download KubeConfig` button


### From Rancher-managed interface

 - In Rancher, go to `Virtualization Management`
 - Check the box next to your cluster
 - Click the `Download KubeConfig` button


## Place the Kubeconfig file in the proper location

You'll want your downloaded `Kubeconfig` to be in the same directory as your Terraform files, with the name `kubeconfig.yaml`


## Prepare Terraform

 - Make sure you're `cd`'d in to the directory containing your Terraform files
 - Run the command `terraform init` to download the provider files


## Check your configurations

 - Run `terraform plan` to check that your configurations are as you want them to run


## Apply your changes

 - Run `terraform apply` to make your changes