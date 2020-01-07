module "common_bucket_label" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  context = module.base_label.context
  name    = "common"
}

module "infra_bucket_label" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  context = module.base_label.context
  name    = "infra"
}

module "nexus_bucket_label" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  context = module.base_label.context
  name    = "nexus"
}

//TODO names too
resource "aws_s3_bucket" "common" {
  bucket = "${var.project_rev_fqdn}.common"
  acl    = "private"
  tags   = module.common_bucket_label.tags
}

resource "aws_s3_bucket" "infra" {
  bucket = "${var.project_rev_fqdn}.infra"
  acl    = "private"
  tags   = module.infra_bucket_label.tags
}

resource "aws_s3_bucket" "nexus" {
  bucket = "${var.project_rev_fqdn}.nexus"
  acl    = "private"
  tags   = module.nexus_bucket_label.tags

  lifecycle {
    ignore_changes = [lifecycle_rule]
  }
}

resource "aws_s3_account_public_access_block" "block" {
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
