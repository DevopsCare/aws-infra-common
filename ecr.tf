module "ecr_label" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  context = module.base_label.context
  name    = "ecr"
}

resource "aws_ecr_repository" "ecr" {
  count = length(var.projects)
  name  = "${var.project_prefix}/${element(var.projects, count.index)}"
  tags  = module.ecr_label.tags
}

