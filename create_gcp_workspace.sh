#!/bin/bash

# This function should be in all different cloud vendor scripts
# as what we create in each cloud may be slightly different
create_variables () {
  # GCP specific variables to create
  # DO NOT PUT YOUR SECRETS (gcp_credentials) HERE!!!   Do this via the GUI
  CATEGORY=terraform
  create_variable gcp_project ${PROJECT}
  create_variable gcp_region ${REGION}
  create_variable gcp_zone ${ZONE}
  create_variable machine_type ${MACHINE_TYPE}
  create_variable instance_name ${OWNER}-${WORKSPACE}
  create_variable owner ${OWNER}
  create_variable ttl ${TTL}
  # Environment variables
  # DO NOT PUT YOUR SECRETS HERE!!!   Do this via the GUI
  CATEGORY=env
  create_variable CONFIRM_DESTROY 1
}

# Load any custom environment variables used in this script
. env.sh

# Load any common functions used across cloud scripts
. base_functions.sh

###  Create GCP Workspaces ###
# Core variables for GCP space
# These re-use common names for functions.
WORKSPACE_PREFIX=${GCP_WORKSPACE_PREFIX}
MACHINE_TYPE=${GCP_MACHINE_TYPE}
PROJECT=${GCP_PROJECT}
REPO=${GCP_REPO}
REGION=${GCP_REGION}
ZONE=${GCP_ZONE}

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
