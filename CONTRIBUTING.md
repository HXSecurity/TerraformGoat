# Contributing to terraformgoat

terraformgoat welcome all contributions.

## GitHub Workflow

The recommended workflow is to fork the repository and
open pull requests from your fork.

### Fork, clone & configure terraformgoat upstream

1. Click on the Fork button on GitHub
2. Clone your fork

```shell
# Clone repository
git clone https://github.com/$YOUR_GITHUB_USER/$REPOSITORY.git
```

### Create a pull request

```shell
# Create a new feature branch
git checkout -b my_feature_branch

# Make changes to your branch
# ...

# Commit changes
git commit -m "your-commit-message"

# Push your new feature branch
git push my_feature_branch

# Create a new pull request to https://github.com/HXSecurity/TerraformGoat.git
```

### Update your pull request with latest changes

```shell
# Checkout main branch
git checkout main

# Update your fork's main branch from upstream
git pull upstream main

# Checkout your feature branch
git checkout my_feature_branch

# Rebase your feature branch changes on top of the updated main branch
git rebase main

# Update your pull request with latest changes
git push -f my_feature_branch
```

## Commits

Each commit should work on its own: it must compile, pass the linter and so on.

### Commit messages

structure as follow:

``` txt
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

> `type` options: `feat`,`fix`,`build`,`chore`, `ci`,`docs`,`style`,`refactor`,`perf`,`test`

See: <https://www.conventionalcommits.org/>

## Docs

Use relative links to markdown files.

## Lint

Unformated commit will be rejected by `GitHub Action`.

Please pass the linter before commit.

- terraform file

``` shell
terraform fmt -recursive
```

- markdown file

```shell
markdownlint README.md  --disable MD013 MD041

markdownlint ./  --disable MD013 MD041
```

See: <https://github.com/igorshubovych/markdownlint-cli>

## How to re-run Github Action

```shell
git commit --amend

# Force push the new commit to re-run all GitHub Actions jobs:
git push -f mybranch
```
