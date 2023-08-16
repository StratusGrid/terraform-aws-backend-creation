<!-- BEGIN_TF_DOCS -->
# Pre Commits
GitHub: [StratusGrid-Pre-Commits](https://gist.github.com/JoseMotto-sg/3c1857664a35594f534b5e4b6be659c4)
This is the gist that serves as an example for the pre-commits blog post.
## Documentation
This repo is self documenting via Terraform Docs.
### `README.md`
It's` this file! I'm always updated via TF Docs!
## Documentation of Misc Config Files
This section is supposed to outline what the misc configuration files do and what is there purpose
### `.config/.terraform-docs.yml`
This file auto generates your `README.md` file. Use this gist as template in your repository!
### `.github/workflows/pre-commit.yml`
This file contains the instructions for Github workflows. This file will call workflows located [here](https://github.com/StratusGrid/workflow-config) and it is the file you should create to use these workflows.

## Offline files
### `.pre-commit-config.yaml`
This file is the GIT pre-commit file and contains all of it's configuration options, it's downloaded from the workflow-config repository when running offline pre-commits.
### `.prettierignore`
This file is the ignore file for the prettier pre-commit actions, it's downloaded from the workflow-config repository when running offline pre-commits.

---
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.12 |
---

## Contributors
- Jose Manuel Motto [JoseMotto-sg](https://github.com/JoseMotto-sg)
<!-- END_TF_DOCS -->