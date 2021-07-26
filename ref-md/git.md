# git
## **_commands_**
### set basic attributes
```
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
```

<br>

### add changes to the staging area
```
git add <filename>
git add .                # to add all changes to the staging area
```

<br>

### commit changes to the repo (-S used to sign a commit using GPG key)
```
git commit -m "Message"
git commit -S -m "Signed commit"   
```

<br>

### to push chamges to remote server
```
git push
```

<br>

### to pull change
```
git pull
```

<br>

### to fetch a repo
```
git clone git@github.com:user/my-project.git
```

<br>

### add multiple origins
```
git remote add github git@github.com:user/my-project.git
git remote add gitlab git@gitlab.com:user/my-project.git
```

<br>

### use specific remote to push
```
git push -u gitlab main
git push -u github main
```

<br>

### shows untracked files
```
git status
```

<br>

### shows details of all commits
```
git log
```

<br>
