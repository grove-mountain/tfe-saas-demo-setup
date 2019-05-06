provider "tfe" {
  hostname = "${var.hostname}"
  token    = "${var.token}"
}

resource "tfe_workspace" "main_workspace" {
  name                = "${var.workspace_name}"
  organization        = "${var.organization}"
  auto_apply          = "${var.auto_apply}"
  terraform_version   = "${var.terraform_version}"

  vcs_repo {
    identifier    = "${var.vcs_repo_identifier}"
    branch        = "${var.vcs_repo_branch}"
    oath_token_id = "${var.vcs_repo_oauth_token_id}"
  }

}

resource "tfe_variable" "aws_region" {
  key          = "aws_region"
  value        = "${var.aws_region}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.main_workspace.id}"
  sensitive    = false
}

resource "tfe_variable" "instance_type" {
  key          = "instance_type"
  value        = "${var.instance_type}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.main_workspace.id}"
  sensitive    = false
}

resource "tfe_variable" "tag_name" {
  key          = "name"
  value        = "${var.tag_name}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.main_workspace.id}"
  sensitive    = false
}

resource "tfe_variable" "tag_owner" {
  key          = "owner"
  value        = "${var.tag_owner}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.main_workspace.id}"
  sensitive    = false
}

resource "tfe_variable" "tag_ttl" {
  key          = "ttl"
  value        = "${var.tag_ttl}"
  category     = "terraform"
  workspace_id = "${tfe_workspace.main_workspace.id}"
  sensitive    = false
}

resource "tfe_variable" "aws_access_key" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = "${var.aws_access_key}"
  category     = "env"
  workspace_id = "${tfe_workspace.main_workspace.id}"
  sensitive    = false
}

resource "tfe_variable" "aws_secret_key" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = "${var.aws_secret_key}"
  category     = "env"
  workspace_id = "${tfe_workspace.main_workspace.id}"
  sensitive    = true
}

resource "tfe_variable" "confirm_destroy" {
  key          = "CONFIRM_DESTROY"
  value        = "${var.confirm_destroy}"
  category     = "env"
  workspace_id = "${tfe_workspace.main_workspace.id}"
  sensitive    = false
}
