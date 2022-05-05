locals {
  name        = var.name != null ? var.name : var.product
  description = var.description != null ? var.description : "${local.name} namespace"
  vpc_id      = var.vpc_id != null ? var.vpc_id : data.aws_vpc.vpc[0].id

  create_http_namespace    = var.type == "http"
  create_private_namespace = var.type == "private"
  create_public_namespace  = var.type == "public"

  id          = var.type == "http" ? aws_service_discovery_http_namespace.namespace[0].id : var.type == "private" ? aws_service_discovery_private_dns_namespace.namespace[0].id : var.type == "public" ? aws_service_discovery_public_dns_namespace.namespace[0].id : null
  arn         = var.type == "http" ? aws_service_discovery_http_namespace.namespace[0].arn : var.type == "private" ? aws_service_discovery_private_dns_namespace.namespace[0].arn : var.type == "public" ? aws_service_discovery_public_dns_namespace.namespace[0].arn : null
  hosted_zone = var.type == "http" ? null : var.type == "private" ? aws_service_discovery_private_dns_namespace.namespace[0].hosted_zone : var.type == "public" ? aws_service_discovery_public_dns_namespace.namespace[0].hosted_zone : null

  creator = "terraform"

  tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      provisioner                               = data.aws_caller_identity.current.user_id
      repo                                      = var.repo
    }
  )
}
