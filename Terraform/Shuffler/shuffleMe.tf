resource "random_shuffle" "az" {
  input        = ["us", "ca", "cn"]
}

output "results" {
    value = resource.random_shuffle.az.result
}