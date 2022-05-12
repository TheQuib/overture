resource "kubernetes_deployment" "nginx-test" {
    metadata {
      name = "nginx-test"
      labels = {
          app = "nginx-test"
      }
    }

    spec {
        replicas = 3
        selector {
            match_labels = {
                app = "nginx-test"
            }
        }
        template {
            metadata {
                labels = {
                    app = "nginx-test"
                }
            }
            spec {
                container {
                    name = "nginx-test"
                    image = "ghcr.io/thequib/nginx-docker:latest"
                    port {
                        container_port = 80
                        name = "web"
                    }
                }
            }
        }
    }
}