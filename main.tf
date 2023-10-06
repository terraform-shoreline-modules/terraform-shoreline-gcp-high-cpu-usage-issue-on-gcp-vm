terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "high_cpu_usage_issue_on_gcp_vm" {
  source    = "./modules/high_cpu_usage_issue_on_gcp_vm"

  providers = {
    shoreline = shoreline
  }
}