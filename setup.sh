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

#creating out index.html file
touch index.html

# Initialize a new node project
npm init -y

# Prompt for Prettier version
echo -e "\n"
read -p "Enter the verison of Prettier you want to install: " prettierVersion

# Install Prettier with specified version
echo "Installing prettier@$prettierVersion"
npm i -D prettier@$prettierVersion

# Prompt for EsLint version
echo -e "\n"
read -p "Enter the verison of ESLint you want to install: " eslintVersion
read -p "Enter the verison of ESLint-config-prettier you want to install: " eslint_config_prettierVersion

# Install ESLint with specified version
echo "Installing ESLint@$eslintVersion"
echo "Installing ESLint-config-prettier@$eslint_config_prettierVersion"
npm i -D eslint@$eslintVersion eslint-config-prettier@$eslint_config_prettierVersion 

# Create ESLint configuration file
echo "Creating ESLint configuration file..."
echo '{
    "extends": [
        "eslint:recommended",
        "plugin:import/errors",
        "plugin:react/recommended",
        "plugin:jsx-a11y/recommended",
        "plugin:react-hook/recommended",
        "prettier"
    ],
    "rules": {
        "react/prop-types": 0,
        "react/react-in-jsx-scope": 0
    },
    "plugins": ["react", "import", "jsx-a11y"],
    "env": {
        "browser": true,
        "es6": true,
        "node": true
    },
    "settings": {
    "react": {
      "version": "detect"
    },
    "import/resolver": {
      "node": {
        "extensions": [".js", ".jsx"]
      }
    }
  }
}' > .eslintrc.json

# Creating the git .ignore file
echo "Creating git .ignore file..."
echo '
node_modules/
dist/
.env
.DS_Store
coverage/
.vscode/
' > .gitignore


# Prompt for vite version
read -p"Enter the verison of Vite: " viteVersion
read -p"Enter the version of @vitejs/plugins-react: " vitejs_plugins_react

# Installing vite
echo "Initializing the new React project with the lastest version of Vite..."
npm i -D vite@$viteVersion @vitejs/plugin-react@$vitejs_plugins_react

# Creating the vite.config.js file
echo "Creating vite.config.js file..."
echo '
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
    plugins: [react()],
});
' > vite.config.js

# Prompt for react version
read -p"Enter the react and react DOM version you want to use: " reactVersion
# Inistalling react
echo "Installing react and react-dom..."
npm i react@$reactVersion react-dom@$reactVersion

# Prompt ESLint plugins
read -p"install eslint-plugin-import@: " import 
read -p"install eslint-plugin-jsx-a11y@: " a11y
read -p"installeslint-plugin-react@: " react3

# Install ESLint plugins
echo "Installing ESLint pluggins..."
npm install eslint-plugin-import@$import install eslint-plugin-jsx-a11y@$a11y eslint-plugin-react@$react3


# Create Prettier configuration file
echo "Creating Prettier configuration file..."
echo "{}" > .prettierrc.js

# Update package.json scripts
echo "Updating package.json scripts..."
npx json -I -f package.json -e '
    this.scripts["dev"] = "vite"; 
    this.scripts["build"] = "vite build";
    this.secripts["preview"] ="vite preview";
    this.scripts["format"] = "prettier --write \"src/**/*.{js,jsx}\""; 
    this.scripts["lint"] = "eslint \"src/**/*.{js,jsx}\" --quiet --fix";
    ' 
echo "Project setup completed successfully."