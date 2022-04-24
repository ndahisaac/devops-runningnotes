 
 cd aws-devops/
  git clone https://git-codecommit.us-east-2.amazonaws.com/v1/repos/demo
cd demo/
## configure your local repo ##
# provide your email address  
git config --global user.email your-email-address
# type the following command to verified your credential
git config user.email
# provide your  username
git config --global user.name "your-user-name"
# type the following command verified  your credential
git config user.name
# check the status of your file
git status
# add the your code to local repo
git add .
# Save your the code you edited with the following command 
git commit -m "my first commit"
# View the track your code with the following 
git status
# Upload your code to the remote repo with the following 
git push
# Creating a new branch
  git checkout -b  dev
  # Edit your code and type the following command
  git status
  git add index.html
  git commit -m "modified index.html to v3"
  git push
 git push --set-upstream origin dev


=====================================================================
git push
git status
git status
git status
git add .
git commit -m "modified index.html to v1"
git push
git status
git add . index.html
git commit -m "modified index.html to v2"
git push
history
===============================================================================================================
 # limit pushes and merges to branches in aws codecommit
 