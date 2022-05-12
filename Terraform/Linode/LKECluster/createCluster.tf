resource "linode_lke_cluster" "terraform-cluster" {
    label       = "terraform-cluster"
    k8s_version = "1.21"
    region      = "us-east"
    tags        = ["terraform"]

    pool {
        type  = "g6-nanode-1"
        count = 3
    }
}