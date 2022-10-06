# PBS TF Namespace Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-namespace-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

This module provisions a CloudMap namespace.

There are three types of namespaces that you might want to provision:

- HTTP
- Private
- Public

[This][cloudmap-docs] is where you can start learning about this service.

To put it simply, an HTTP namespace is a namespace that allows services to be discovered by AWS services that integrate with CloudMap (usually App Mesh).

e.g. `app.example-http-namespace`

A private namespace is effectively a private hosted zone that is managed by AWS. A service that is registered with a private namespace will receive a DNS record that is only resolvable within the VPC that the namespace is associated with.

e.g. `app.example.private`

A public namespace is effectively a public hosted zone that is managed by AWS. A service that is registered with a public namespace will receive a DNS record that is resolvable globally.

e.g. `app.example.com`

Integrate this module like so:

### HTTP Namespace

```hcl
module "namespace" {
  source = "github.com/pbs/terraform-aws-namespace-module?ref=x.y.z"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

### Private Namespace

```hcl
module "namespace" {
  source = "github.com/pbs/terraform-aws-namespace-module?ref=x.y.z"

  type = "private"
  name = "example.private"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

### Public Namespace

```hcl
module "namespace" {
  source = "github.com/pbs/terraform-aws-namespace-module?ref=x.y.z"

  type = "public"
  name = "example.org"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs
[cloudmap-docs]: https://docs.aws.amazon.com/cloud-map/latest/dg/what-is-cloud-map.html
