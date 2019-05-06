# Environment variable fed
# aws_access_key
# aws_secret_key
# token 
# vcs_repo_oauth_token_id 

hostname            = "app.terraform.io"
organization        = "jlundberg-labs"
workspace_name      = "aws-ec2-instance-module-test-qa"
auto_apply          = true
terraform_version   = "latest"
vcs_repo_identifier = "grove-mountain/terraform-aws-ec2-instance"
vcs_repo_branch     = "qa"
aws_region          = "us-east-2"
instance_type       = "t2.small"
confirm_destroy     = 1
tag_name            = "jlundberg-tfe-test-ec2-instance-qa"
tag_owner           = "jlundberg"
tag_ttl             = "1"
