variable "hostname" {
 description = "Hostname for the TFE server"
  default     = "app.terraform.io"
}

variable "organization" {
  description = "Organization to put workspaces into"
}

variable "workspace_name" {
  description = "The name for this workspace.  Should be unique"
}

variable "token" {
  description = "User token used to login to TFE"
}

## Workspace config variables
variable "auto_apply" {
    description = "Turn on auto apply on VCS merges to this branch"
    default     = "false"
}

variable "terraform_version" {
  description = "Terraform version to use for this workspace.  Must be a version you can see in the GUI"
  default     = "latest"

}

variable "vcs_repo_identifier" {
    description = " A reference to your VCS repository in the format :org/:repo where :org and :repo refer to the organization and repository in your VCS provider."
}

variable "vcs_repo_branch" {
    description = "The repository branch that Terraform will execute from. Default to master."
    default     = "master"
}

# The easiest way to get this variable is to use the following:
# ATLAS_TOKEN=<User Token for an org>
# ORGANIZATION=<The org the workspace is going into>
# TFE_ENDPOINT=<TFE Server Address> (e.g. app.terraform.io)
# curl -s --header "Authorization: Bearer $ATLAS_TOKEN"   \
# --header "Content-Type: application/vnd.api+json"   \
# --request GET https://${TFE_ENDPOINT}/api/v2/organizations/${ORGANIZATION}/oauth-clients \
#  | jq -r '.data[0].relationships["oauth-tokens"].data[0].id'

variable "vcs_repo_oauth_token_id" {
    description = "Token ID of the VCS Connection (OAuth Conection Token) to use."
}

## Workspace run variables
variable "aws_region" {
  description = "Region to put resources into"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "AWS Instance type to launch"
  default     = "t2.micro"
}

variable "confirm_destroy" {
  description = "Whether to allow this workspace to be destroyed.  Set 1 to allow"
  default = "1"
}

variable "aws_access_key" {
  description = "AWS access key used to login to AWS.  Should have the ability to create resources defined in your modules (Usually Admin level)"
}

variable "aws_secret_key" {
  description = "AWS secret access key to match the access key defined.   DO NOT CHECK INTO VERSION CONTROL!"
}

variable "tag_name" {
  description = "Name for any resources created"
}

variable "tag_owner" {
  description = "Name of the resource owner for the Owner tag. This is a mandatory tag for us"
}

variable "tag_ttl" {
  description = "TTL to set for nodes.   This is a mandatory tag"
}

