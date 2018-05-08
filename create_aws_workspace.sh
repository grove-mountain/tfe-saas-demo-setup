#!/bin/bash

# This function should be in all different cloud vendor scripts
# as what we create in each cloud may be slightly different
create_variables () {
  # AWS specific variables to create
  CATEGORY=terraform
  create_variable name ${OWNER}-${WORKSPACE}
  create_variable aws_region ${REGION}
  create_variable instance_type ${INSTANCE_TYPE}
  create_variable owner ${OWNER}
  create_variable ttl ${TTL}
  # Environment variables
  # DO NOT PUT YOUR AWS_SECRET_ACCESS_KEY HERE!!!   Do this via the GUI
  CATEGORY=env
  create_variable AWS_ACCESS_KEY_ID ${AWS_ACCESS_KEY}
  create_variable CONFIRM_DESTROY 1
}

# Load any custom environment variables used in this script
. env.sh

# Load any common functions used across cloud scripts
. base_functions.sh

###  Create AWS Workspaces ###
# Core variables for AWS space
# These re-use common names for functions.
WORKSPACE_PREFIX=${AWS_WORKSPACE_PREFIX}
INSTANCE_TYPE=${AWS_INSTANCE_TYPE}
REPO=${AWS_REPO}
REGION=${AWS_REGION}

# Create QA branch workspace
BRANCH=qa
WORKSPACE=${WORKSPACE_PREFIX}-${BRANCH}
# Create the workspace with the variables above
create_workspace
create_variables

# Create PROD branch workspace
BRANCH=prod
WORKSPACE=${WORKSPACE_PREFIX}-${BRANCH}
create_workspace
create_variables
