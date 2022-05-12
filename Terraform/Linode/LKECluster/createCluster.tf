resource "linode_lke_cluster" "terraform_cluster" {
    label = var.lke_cluster_label
    k8s_version = var.lke_kubernetes_version
    region = var.lke_cluster_region
    tags = var.lke_cluster_tags

    pool {
        type  = var.lke_pool_type
        count = var.lke_pool_count
    }
}

data "linode_lke_cluster" "terraform_cluster_info" {
    id = resource.linode_lke_cluster.terraform_cluster.id
}