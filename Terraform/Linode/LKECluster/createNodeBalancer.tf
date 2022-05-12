resource "linode_nodebalancer" "terraformClusterNodeBalancer" {
    label =  var.nodebalancer_label
    region = var.lke_cluster_region
    tags = var.lke_cluster_tags
}

resource "linode_nodebalancer_config" "terraformClusterNodeBalancerConfig" {
    nodebalancer_id = resource.linode_nodebalancer.terraformClusterNodeBalancer.id
    port = 80
    protocol = "http"
}