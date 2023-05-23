#!/bin/bash

# Set the repository URL and branch
REPO_URL="https://github.com/Neev0slid/LimeScript-v2.0.git"
BRANCH="master"

# Function to update the script
update_script() {
    # Navigate to the script directory
    local file_path
    read -p "paste the path to your script here(/path/to/script/directory): " file_path
    cd $file_path

    # Check if the directory is a Git repository
    if [ ! -d ".git" ]; then
        echo "Error: Not a Git repository. Please initialize the directory as a Git repository."
        exit 1
    fi

    # Add the remote repository URL
    git remote add origin "$REPO_URL"

    # Pull the latest changes from the repository
    git pull origin "$BRANCH"

    echo "Script updated successfully."
}

# Call the update_script function
update_script
