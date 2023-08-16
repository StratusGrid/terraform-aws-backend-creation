<!-- BEGIN_TF_DOCS -->
# Pre Commits
GitHub: [StratusGrid-Pre-Commits](https://gist.github.com/JoseMotto-sg/3c1857664a35594f534b5e4b6be659c4)
This is the gist that serves as an example for the pre-commits blog post.
## Documentation
This repo is self documenting via Terraform Docs, please see the note at the bottom.
### `README.md`
It's` this file! I'm always updated via TF Docs!
## Documentation of Misc Config Files
This section is supposed to outline what the misc configuration files do and what is there purpose
### `.config/.terraform-docs.yml`
This file auto generates your `README.md` file.

### `.github/workflows/pre-commit.yml`
This file contains the instructions for Github workflows. This file will call workflows located [here](https://github.com/StratusGrid/workflow-config)
### `.pre-commit-config.yaml`
This file is the GIT pre-commit file and contains all of it's configuration options
### `.prettierignore`
This file is the ignore file for the prettier pre-commit actions.

### `.tflint.hcl`
This file contains the plugin data for TFLint to run.
---
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.12 |
---
# Test your pre-commit hooks - This will force them to run on all files
```
pre-commit run --all-files
```
# Add your pre-commit hooks forever
```
pre-commit install
```
## Contributors
- Jose Manuel Motto [JoseMotto-sg](https://github.com/JoseMotto-sg)
<!-- END_TF_DOCS -->