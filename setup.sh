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
    npx create-vite@latest my-react-app --template react
else
    echo "Initializing the new Rect project with Vite@$viteVersion..."
    npx create-vite@$viteVersion my-react-app --template react
fi

# Switching to the project directory
cd my-react-app || { echo "Failed to switch to project directory."; exit 1;}

# Inistalling dependencies
echo "Installing dependencies..."
#npm install

# Prompt for EsLint version
read -p "Enter the verison of ESLint you want to install: " eslintVersion

# Install ESLint with specified version
echo "Installing ESLint@$eslintVersion"
# npm install eslint@$eslintVersion --save-dev

# Prompt for Prettier version
read -p "Enter the verison of Prettier you want to install: " prettierVersion

# Install Prettier with specified version
echo "Installing ESLint@$prettierVersionVersion"
# npm install prettier@$prettierVersion --save-dev

# Create ESLint configuration file
echo "Creating ESLint configuration file..."
# npx eslint --init --quiet

# Install ESLint pluggins
echo "Installing ESLint pluggins..."
# npm install eslint-plugin-react eslint-plugin-react-hooks --save-dev


# Create Prettier configuration file
echo "Creating Prettier configuration file..."
echo "module.exports = {};" > .prettierrc.js

# Update package.json scripts
echo "Updating package.json scripts..."
# npx json -I -f package.json -e 'this.scripts["lint"] = "eslint ."; this.scripts["format"] = "prettier --write \"src/**/*.{js,jsx}\""; this.scripts["build"] = "vite build"; this.scripts["lint"] = "eslint \"src/**/*.{js,jsx}\" --quiet --fix"'

# Modify .eslintrc.json file
echo "Modifying .eslintrc.json file..."
# npx json -I -f .eslintrc.json -e 'this.rules["react/prop-types"] = 0; this.rules["react/react-in-jsx-scope"] = 0'

# Start the development server
echo "Starting the development server..."
#npm run dev

echo "Project setup completed successfully."