terraform {

    required_version = ">= 0.13.0"

    required_providers {
        random = {
            source = "hashicorp/random"
            version = "3.1.2"
        }
    }
}

provider "random" {

}