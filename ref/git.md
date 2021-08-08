# git

## **_commands_**
```bash
# set basic attributes
# remove the --global flag to set the attributes to the local repo
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
git config --global user.signingkey "youremail@domain.com"          # email of the gpg key

# add changes to the staging area
git add <filename>
git add .                # to add all changes to the staging area

# commit changes to the repo (-S used to sign a commit using GPG key)
git commit -m "Message"
git commit -S -m "Signed commit"   

# pull or push chamges to remote server
git push
git pull

# use specific remote to push or pull from
git [push|pull] [remote] [branch]
git push -u gitlab main
git pull gitlab main

# restore a file from last commit state
git restore .
git restore [file]

# fetch a repo
git clone git@github.com:user/my-project.git

# add multiple origins
git remote add [remote-name] git@[remote-url]:user/my-project.git
git remote add github git@github.com:user/my-project.git          # example
git remote -v                                                     # view all remotes
git remote show [remote-name]                                     # shows detailed info

# shows untracked files
git status
git status -s       #short version 

# shows details of all commits
git log

# reset working dir files to a sepcific commit [be cautious!]
git reset --hard <commit hash>

# remove files from staging area back to untracted stage
git restore --staged <file>

# checkout a branch or commit
git checkout [branch|commit-hash]

# branches
git branch                            # lists all local brnaches
git branch -a                         # list remote branches too
git branch -vv                        # lists tracking branches 
git remote show [remote-name]         # shows detailed info
git branch <branch-name>              # creates new branch  
git checkout <branch-name>            # checkout specific branch (works even if it is on a remote repo)
git checkout -b <branch-name>         # creating & checking out new branch with 1 command
git branch -d <branch-name>           # delete a branch
git branch -D <branch-name>           # delete a branch forcefully 
git push [remote] -d [branch]   # delete remote branch
git branch -m <old-name> <new-name>   # rename a branch
git remote update [remote] --prune    # local update of deleted branches in remote repo

# show differences of old & new version of file
git diff

# merge (must be done on the branch to merge with, usually on the master branch)
git merge <feature-branch-name>

# make the repo a regular folder
rm -rf .git

# show refs
git show-ref

```

## low level commands
```bash
# cat-file [ -p : content of file , -t : type of file , -s : size of file ]
git cat-file <options> <hash>

# hash-object, creates git objects
# if -w option is not used then we only get the hash outputted to console
# if -w option is used then the file is saved in the repo
echo "Hello world" | git hash-object --stdin -w
git hash-object <filename> -w

# list files in staging area
git ls-files -s

# put files from repo to staging area
git read-tree <tree-hash>

# put all files from staging area to working dir
git checkout-index -a

# unpack objects 
mv .git/objects/pack/pack-asdsad.pack ../../
cat <pack-file> | git unpack-objects
```

## explainations
```bash

: <<'END_COMMENT'
## understanding git diff with example
     diff --git a/file1 b/file1
     index 418bc71..25cf24f 100644
     --- a/file1
     +++ b/file1
     @@ -5,3 +5,6 @@
     -another line in file
     +first line in file1
     hai world bobby
     
     +
     +fifth line in file1
     +

# explaining in sections

# section 1
     -- a/file1 refers to old version of file
     ++ b/file1 refers to new version of file

# section 2
     @@ -5,3 +5,6 @@
          |  | 
          |  |_ 6 lines have been extracted from line 5
          | 
          |_ 3 lines have been extracted from line 5

# section 3
     -another line in file
     +first line in file1
     hai world bobby
     
     +
     +fifth line in file1
     +

     '-' denotes line is deleted
     '+' denotes line is added
END_COMMENT
```

<br>
