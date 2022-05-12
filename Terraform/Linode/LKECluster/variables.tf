variable linode_token {
    type = string
    description = "API token created in linode with access to desired resources"
    sensitive = true
}

# Cluster settings
variable lke_cluster_label {
    type = string
    description = "Label for the LKE cluster"
}
variable lke_kubernetes_version {
    type = string
    description = "LKE Kubernetes version"
}
variable "lke_cluster_region" {
    type = string
    description = "Region to place the LKE cluster"
}
variable "lke_cluster_tags" {
    type = list
    description = "Tags to assign to the LKE cluster"
}
variable "lke_pool_type" {
    type = string
    description = "Type of Linode instances to create"
}
variable "lke_pool_count" {
    type = number
    description = "Number of Linode instances to add to the cluster"
}

# NodeBalancer settings
variable nodebalancer_label {
    type = string
    description = "Label for the LKE's NodeBalancer"
}