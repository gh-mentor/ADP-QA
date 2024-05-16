# This bash script uses git commands to do the following:
# 1. Add all files in the workspace to the staging area
# 2. Commit the changes to the local repository
# 3. Push the changes to the remote repository targeting the 'main' branch

# Add all files in the workspace to the staging area
git add .

# Commit the changes to the local repository
git commit -m "Update"

# Push the changes to the remote repository targeting the 'main' branch
git push origin main