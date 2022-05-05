module "namespace" {
  source = "../.."

  type = "private"
  name = "example.private"

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}
