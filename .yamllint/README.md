## Yamllinter

Yamllint is a linter for YAML files. It checks for syntax validity and also enforces a set of style
rules, for example, indentation and line length.
This helps maintain consistency and readability in YAML files.

### Configuration

Yamllint can be configured using a `.yamllint` configuration file. This file allows you to specify
which rules to enforce and customize their behavior.

### Installation

To install yamllint, you can check quickstart
on [website](https://yamllint.readthedocs.io/en/latest/quickstart.html), but if you have
simply do next:

```shell
brew install yamllint
```

### Usage

To check lint of yaml files in this project, in root do next:

```shell
bash scripts/test_yaml_lint.sh 
```
