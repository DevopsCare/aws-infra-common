module "base_label" {
  source              = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.7.0"
  namespace           = "${var.project_rev_fqdn}"
  regex_replace_chars = "/[^a-zA-Z0-9-.]/"
  delimiter           = "."
}
