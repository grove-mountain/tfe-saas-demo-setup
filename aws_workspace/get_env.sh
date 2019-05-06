. ~/.aws_demo_creds
. ~/.tfe_saas_token
. ~/.github_token_env

export TF_VAR_aws_access_key=${AWS_ACCESS_KEY_ID}
export TF_VAR_aws_secret_key=${AWS_SECRET_ACCESS_KEY}
export TF_VAR_token=${ATLAS_TOKEN}
export TF_VAR_vcs_repo_oauth_token_id=${GITHUB_TOKEN}
