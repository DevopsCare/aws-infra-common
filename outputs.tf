output "cad3_superuser" {
  value = var.create_superuser ? aws_iam_role.cad3_superuser : tuple()
}
