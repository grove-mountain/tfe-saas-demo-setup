module "test-module" {
  source                  = "../"
  workspace_name          = "${var.workspace_name}"
  vcs_repo_identifier     = "${var.vcs_repo_identifier}"
  aws_secret_key          = "${var.aws_secret_key}"
  organization            = "${var.organization}"
  token                   = "${var.token}"
  vcs_repo_oauth_token_id = "${var.vcs_repo_oauth_token_id}"
  aws_access_key          = "${var.aws_access_key}"
  tag_name                = "${var.tag_name}"
  tag_owner               = "${var.tag_owner}"
  tag_ttl                 = "${var.tag_ttl}"
}
