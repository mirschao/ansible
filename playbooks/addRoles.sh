#!/usr/bin/env bash
#
# Script to create a new Ansible role
# Usage: ./add_roles.sh <role_name>
# Author: mirschao
# Date: 2024-12-29
# Version: 1.0
# ----------------------------------
# Description:
# This script creates a new Ansible role with the specified name.
# The role directory structure is created with the following layout:
# roles/<role_name>/scripts
# roles/<role_name>/tasks
# roles/<role_name>/templates
# roles/<role_name>/tasks/main.yml
# ----------------------------------
# Changelog:
# 2024-12-29 - Initial version
# ----------------------------------
# Script starts here


# Function to check if a role already exists
check_role_exists() {
    local role_name=$1
    if [ -d "roles/$role_name" ]; then
        echo "Role '$role_name' already exists."
        exit 1
    fi
}

# Function to create the role directories and files
create_role() {
    local role_name=$1
    mkdir -p "roles/$role_name/scripts"
    mkdir -p "roles/$role_name/tasks"
    mkdir -p "roles/$role_name/templates"
    touch "roles/$role_name/tasks/main.yml"
    echo "Role '$role_name' has been created successfully."

    # create of site.yml roles after line add:
    sed -i '' "/roles:/a\\
    - { role: \"$role_name\", tags: [ \"$role_name\" ] }
    " site.yml
    echo "Role '$role_name' has been added to site.yml."
}

# Main script execution
main() {
    if [ -z "$1" ]; then
        echo "Usage: $0 <role_name>"
        exit 1
    fi

    local role_name=$1
    check_role_exists "$role_name"
    create_role "$role_name"
}

# Execute the main function with all script arguments
main "$@"
