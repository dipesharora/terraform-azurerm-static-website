variable "prefix" {
  type        = string
  description = "A prefix to add to the storage account name to make it unique. A random number will also be added."
  validation {
    condition     = can(regex("^[a-z0-9]{1,14}$", var.prefix))
    error_message = "Prefix must be 1-14 lowercase alphanumeric characters."
  }
}

variable "location" {
  type        = string
  description = "The region where the resources are created."
  validation {
    condition     = endswith(var.location, "us")
    error_message = "Only US regions allowed."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Existing resource group where the static website storage will be created."
}

variable "env" {
  type        = string
  description = "Value for the environment tag."
  validation {
    condition     = contains(["dev", "test", "prod", "demo"], var.env)
    error_message = "Environment must be one of: dev, test, prod, demo."
  }
}

variable "department" {
  type        = string
  description = "Value for the department tag."
  default     = "WebDev"
}

variable "storage_kind" {
  type        = string
  description = "Kind of storage account to create."
  default     = "StorageV2"
  validation {
    condition     = contains(["StorageV2", "BlockBlobStorage"], var.storage_kind)
    error_message = "Kind must be StorageV2 or BlockBlobStorage."
  }
}

variable "storage_tier" {
  type        = string
  description = "Tier of the storage account."
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.storage_tier)
    error_message = "Tier must be Standard or Premium"
  }
}

variable "storage_replication_type" {
  type        = string
  description = "Type of replication to use for the storage account."
  default     = "LRS"
  validation {
    condition     = contains(["LRS", "GRS"], var.storage_replication_type)
    error_message = "Please use LRS or GRS only"
  }
}

variable "hashi_products" {
  type = list(object({
    name       = string
    color      = string
    image_file = string
  }))
  default = [
    {
      name       = "Consul"
      color      = "#dc477d"
      image_file = "hashicafe_art_consul.png"
    },
    {
      name       = "HCP"
      color      = "#ffffff"
      image_file = "hashicafe_art_hcp.png"
    },
    {
      name       = "Nomad"
      color      = "#60dea9"
      image_file = "hashicafe_art_nomad.png"
    },
    {
      name       = "Packer"
      color      = "#63d0ff"
      image_file = "hashicafe_art_packer.png"
    },
    {
      name       = "Terraform"
      color      = "#844fba"
      image_file = "hashicafe_art_terraform.png"
    },
    {
      name       = "Vagrant"
      color      = "#2e71e5"
      image_file = "hashicafe_art_vagrant.png"
    },
    {
      name       = "Vault"
      color      = "#ffec6e"
      image_file = "hashicafe_art_vault.png"
    }
  ]
}
