#!/bin/bash

# This function should be in all different cloud vendor scripts
# as what we create in each cloud may be slightly different
create_variables () {
  # GCP specific variables to create
  # DO NOT PUT YOUR SECRETS HERE!!!   Do this via the GUI
  CATEGORY=terraform
  create_variable compute_instance_instance_name ${OWNER}-${WORKSPACE}
  create_variable compute_instance_gcp_project ${GCP_PROJECT}
  create_variable compute_instance_gcp_region ${GCP_REGION}
  create_variable compute_instance_gcp_zone ${GCP_ZONE}
  create_variable compute_instance_machine_type ${GCP_MACHINE_TYPE}
  create_variable ec2_instance_instance_type ${AWS_INSTANCE_TYPE}
  create_variable ec2_instance_name ${OWNER}-${WORKSPACE}
  create_variable ec2_instance_region ${AWS_REGION}
  create_variable ec2_instance_owner ${OWNER}
  create_variable ec2_instance_ttl ${TTL}
  # Environment variables
  # DO NOT PUT YOUR SECRETS HERE!!!   Do this via the GUI
  CATEGORY=env
  create_variable CONFIRM_DESTROY 1
  create_variable AWS_ACCESS_KEY_ID ${AWS_ACCESS_KEY}
}

# Load any custom environment variables used in this script
. env.sh

# Load any common functions used across cloud scripts
. base_functions.sh

###  Create App42 Workspaces ###
# These re-use common names for functions.
WORKSPACE_PREFIX=${APP42_WORKSPACE_PREFIX}
REPO=${APP42_REPO}

# Create DEV branch workspace
BRANCH=dev
WORKSPACE=${WORKSPACE_PREFIX}-${BRANCH}
# Create the workspace with the variables above
create_workspace
create_variables

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
