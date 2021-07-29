# git

## **_commands_**
```bash
# set basic attributes
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"

# add changes to the staging area
git add <filename>
git add .                # to add all changes to the staging area

# commit changes to the repo (-S used to sign a commit using GPG key)
git commit -m "Message"
git commit -S -m "Signed commit"   

#  push chamges to remote server
git push

#  pull change
git pull

# restore a file last commit state
git restore .
git restore [file]

# fetch a repo
git clone git@github.com:user/my-project.git

# add multiple origins
git remote add github git@github.com:user/my-project.git
git remote add gitlab git@gitlab.com:user/my-project.git

# use specific remote to push
git push -u gitlab main
git push -u github main

# shows untracked files
git status

# shows details of all commits
git log
```

<br>
