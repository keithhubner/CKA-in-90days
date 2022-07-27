# Setting up the Civo Terraform provider Securely

> IMPORTANT - There is currently a bug in the Civo provider when trying to destroy the environment, this is currently being investigated. This results in manually deleting the network and firewall from Civo and resetting the terraform state.

To ensure your API key is kept secret it is important that this is not included in your terraform code. This guide shows how to store the API key as an environment variable, you could store this value in the .tfvars file but you could argue that anything written in code is vulnerable to accidental or malicious exposure. 

First create an environment variable which will only reside on your local machine:

> API key is available at [Civo.com > Account > Settings > Security](https://www.civo.com/account/security)

```
export CIVO_KEY="your API key"
```

The provider.tf script will look something like this:
```
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
```

Then we can use this when running our terraform:

> The civo_token variable will be declared in the Terraform script. 

```
terraform plan -var "civo_token=${CIVO_KEY}"
```

## Using SSH key to access virtual machines

Generate your key

Upload the key to Civo

List the keys:
```
civo sshkeys ls
```

save the ID in a file called terraform.tfvars

```
ssh_key_ID = "your_key_here"
```