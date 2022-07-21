<!-- BEGIN_TF_DOCS -->
# terraform-aws-backend-creation

GitHub: [StratusGrid/terraform-aws-backend-creation](https://github.com/StratusGrid/terraform-aws-backend-creation)

## Example

```hcl
module "backend" {
  source  = "stratusgrid/terraform-aws-backend-creation"
  project_name       = "my-awesome-project"
  logging_bucket     = "my-awesome-project-logging"
}
```

## StratusGrid Standards we assume
- This repo is designed to be built upon the [StratusGrid Account Starter Template](https://github.com/StratusGrid/terraform-account-starter), this base template configures the remote backend and SOPS baseline requirements.
- All resource names and name tags shall use `_` and not `-`s
- The old naming standard for common files such as inputs, outputs, providers, etc was to prefix them with a `-`, this is no longer true as it's not POSIX compliant. Our pre-commit hooks will fail with this old standard.
- StratusGrid generally follows the TerraForm standards outlined [here](https://www.terraform-best-practices.com/naming)

## Repo Knowledge

This is the repository that holds the backend module creation for terraform. It's a way to have a quick backend with all the required security measures without the overhead.
It will create a s3 bucket with a dynamodb table.

## Documentation

This repo is self documenting via Terraform Docs, please see the note at the bottom.

### `LICENSE`
This is the standard Apache 2.0 License as defined [here](https://stratusgrid.atlassian.net/wiki/spaces/TK/pages/2121728017/StratusGrid+Terraform+Module+Requirements).

### `outputs.tf`
The StratusGrid standard for Terraform Outputs.

### `README.md`
It's this file! I'm always updated via TF Docs!

### `tags.tf`
The StratusGrid standard for provider/module level tagging. This file contains logic to always merge the repo URL.

### `variables.tf`
All variables related to this repo for all facets.
One day this should be broken up into each file, maybe maybe not.

### `versions.tf`
This file contains the required providers and their versions. Providers need to be specified otherwise provider overrides can not be done.

## Documentation of Misc Config Files

This section is supposed to outline what the misc configuration files do and what is there purpose

### `.config/.terraform-docs.yml`
This file auto generates your `README.md` file.

### `.config/terrascan.yaml`
This file has all of the configuration options required for Terrascan, this is where you would skip rules to.

### `.github/sync-repo-settings.yaml`
This file is our standard for how GitHub branch protection rules should be setup.

### `.github/workflows/pre-commit.yml`
This file contains the instructions for Github workflows, in specific this file run pre-commit and will allow the PR to pass or fail. This is a safety check and extras for if pre-commit isn't run locally.

### `.vscode/settings.json`
This file is a vscode workspace settings file.

### `examples/*`
The files in here are used by `.config/terraform-docs.yml` for generating the `README.md`. All files must end in `.tfnot` so Terraform validate doesn't trip on them since they're purely example files.

### `.gitignore`
This is your gitignore, and contains a slew of default standards.

### `.pre-commit-config.yaml`
This file is the GIT pre-commit file and contains all of it's configuration options

### `.prettierignore`
This file is the ignore file for the prettier pre-commit actions. Specific files like our SOPS config files have to be ignored.

### `.tflint.hcl`
This file contains the plugin data for TFLint to run.

---

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.9 |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_input_tags"></a> [input\_tags](#input\_input\_tags) | Map of tags to apply to resources | `map(string)` | <pre>{<br>  "Developer": "StratusGrid",<br>  "Provisioner": "Terraform"<br>}</pre> | no |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | Name of the bucket used for store the terraform backend logs | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project that will hold this backend | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamodb_table_name"></a> [dynamodb\_table\_name](#output\_dynamodb\_table\_name) | DynamoDB table name |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | S3 bucket ARN |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | S3 bucket ID |

---

Note, manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml`
<!-- END_TF_DOCS -->