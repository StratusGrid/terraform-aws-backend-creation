variable "project_name" {
  description = "Name of the project that will hold this backend"
  type        = string
}

variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default = {
    Developer   = "StratusGrid"
    Provisioner = "Terraform"
  }
}

variable "logging_bucket" {
  description = "Name of the bucket used for store the terraform backend logs"
  type        = string
}