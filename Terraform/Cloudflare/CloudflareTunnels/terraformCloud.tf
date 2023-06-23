terraform {
    cloud {
        organization = var.tf_cloud_organization
            workspaces {
                name = var.tf_cloud_workspace
        }
    }
}

credentials "app.terraform.io" {
    token = var.tf_cloud_token
}