terraform {
  required_providers {
    civo = {
      source = "civo/civo"
      version = "1.0.20"
    }
  }
}

variable "civo_token" {}

provider "civo" {
  token = var.civo_token
}


