module "namespace" {
  source = "../.."

  type = "public"
  name = var.public_hosted_zone

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}
