/*
* Copyright (c) 2020 Risk Focus Inc.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

module "common_bucket_label" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  context = module.base_label.context
  name    = "common"
}

module "infra_bucket_label" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  context = module.base_label.context
  name    = "infra"
}

module "nexus_bucket_label" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
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

/* Superseeded by Organizations Policy
resource "aws_s3_account_public_access_block" "block" {
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}
*/

