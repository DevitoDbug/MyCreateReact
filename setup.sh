#!/bin/bash

# # Check if there is internet connectivity
# if ! ping -q -w 1 -c 1 google.com &>/dev/null; then
#     echo "No internet connection available. Please check your network connection."
#     exit 1
# fi

# Check if Node.js is installed
if ! command -v node &>/dev/null; then
    echo "Node.js is not installed. Installing Node.js...."
    # Add the code to install Node.js
else
    echo "Node.js is already installed."
fi

# Define the project directory
read -p "What is the name of your project: " project_dir

# Create a new directory for the project
echo "Creating directory for your project..."
mkdir $project_dir

# Switch to the project directory
echo "Switching to the created directory..."
cd "$project_dir" || { echo "Failed to switch to project directory"; exit 1; }
pwd

# Prompt for vite version
read -p"Enter the verison of Vite (press ENTER for latest): " viteVersion

#initialize a new React project with vite
if [ -z "$viteVersion"]; then
    echo "Initializing the new React project with the lastest version of Vite..."
else
    echo "Initializing the new Rect project with Vite@$viteVersion..."
fi


echo "Project setup completed successfully."