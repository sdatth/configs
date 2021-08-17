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

# clone a repo
git clone git@github.com:user/my-project.git

# add multiple origins
git remote add [remote-name] git@[remote-url]:user/my-project.git
git remote add github git@github.com:user/my-project.git          # example
git remote -v                                                     # view all remotes
git remote show [remote-name]                                     # shows detailed info

# shows untracked files
git status
git status -s       # short version 

# shows details of all commits
git log

: << 'Example'
# this is output of git log --oneline

300043d (HEAD -> master) c4  -> master                              
daa1140 c3                   -> master~1                                                                 
1837ba1 c2                   -> master~2                                                                 
54c8ffc c1                   -> master~3
Example

# reset
git reset <commit>             # commit to reset to 
git reset master~1             # example
git reset HEAD~2               # example
git reset --hard <commit>      # reset working dir files to a sepcific commit !cautious!
git reset <file>               # remove files from staging area back to untracted stage

# restore ( restore file from a commit )
git restore <file>                # restore a file from current commit
git restore -s <commit> <file>    # restore a file from a particular commit
git restore -s <commit> .         # restore everything from a particular commit
git restore --staged <file>       # restore a file to staging area 

# revert 
git revert <commit>

# checkout a branch or commit
git checkout [branch|commit]      # Switch between branches or inspect old snapshots
git checkout <commit> -- <file>   # restore changes of a file in the working directory

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
git push [remote] -d [branch]         # delete remote branch
git branch -m <old-name> <new-name>   # rename a branch
git remote update [remote] --prune    # local update of deleted branches in remote repo

# stash (git stash temporarily delete changes made to your working copy so you can work on something else
# and then come back and re-apply them later on.)
git stash list               # list available stash
git stash -u                 # save current changes in working dir in a stash cache
git stash pop                # apply the stash and delete from cache
git stash pop <index>        # using index to specify the stash
git stash apply              # apply the stash and keep it in the cache too
git stash apply <index>      # using index to specify the stash
git stash push -m "message"  # use a message to identify uniquely
git stash drop <index>       # delete a particular stash
git stash clear              # delet all stashes

# show differences of old & new version of file
git diff

# merge (must be done on the branch to merge with, usually on the master branch)
git merge <branch-name>

# rebase 
git rebase <branch-name>

# tag a commit
git tag <tag-name>

# worktree
git worktree add <path> <branch>         # create worktree of existing branch
git worktree add -b <new-branch> <path>  # create worktree by creating new branch
git worktree list                        # list worktrees
git worktree remove <branch>             # remove a worktree

# make the repo a regular folder
rm -rf .git

# show refs
git show-ref

# garbage collector
git gc
git prune

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
