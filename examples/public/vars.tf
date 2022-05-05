variable "public_hosted_zone" {
  type        = string
  description = "Public hosted zone for this Namespace. Populate `TF_VAR_public_hosted_zone` before running any tests to have this value populated."
}
