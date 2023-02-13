#!/bin/bash

#Adding gitignore to keep important files out of the web
echo"#This is your gitignore">gitignore
echo "#Ignore possible json files">>.gitignore
echo "*.json" >>.gitignore
#Accesing github secret
github_user=$(tail -n +1 ../auth | head -n 1)
github_token=$(tail -n +2 ../auth | head -n 1)
echo "$github_token"

#Define repo name using current folder name
repo_name=$(basename $(pwd))

# Define the API endpoint for creating a repository on GitHub
api_endpoint="https://api.github.com/user/repos"

# Create a GitHub repository with the given name
curl -H "Authorization: token $github_token" -H "Accept: application/vnd.github+json" -d "{\"name\":\"$repo_name\",\"private\":True}" $api_endpoint > ../info_$repo_name.json
# Change to the local repository directory
echo "Created repo:$repo_name on github"
# Set the remote origin for the local repository to the GitHub repository
git remote add origin https://$github_user:$github_token@github.com/$github_user/$repo_name.git
# Push the local repository to the GitHub repository
git push -u origin master
echo "Local repo added to github. God speed"

