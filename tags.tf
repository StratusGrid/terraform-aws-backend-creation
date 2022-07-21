locals {
  tags = merge(var.input_tags, {
    "ModuleSourceRepo" = "StratusGrid/terraform-aws-backend-creation"
  })
}