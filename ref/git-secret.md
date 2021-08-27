# git-secret

pre-prerequisite
- git
- gpg
- git-secret

<br>

## commands
```bash
# prints all the available commands
git secret usage  

# Initialize the repository if you have not done it already                          
git init  

# Initialize the repository using git-secret                              
git secret init 

# Add a user                        
git secret tell email@example.com  

# Get a list of which users are attached on the repo        
git secret whoknows         

# Add a file on the encryption list
git secret add file.txt   

# Encrypt files of the list                  
git secret hide         

# deletes files from .gitsecret/paths/mapping.cfg, so they won’t be encrypted or decrypted in the future                   
git secret remove file.txt     

# removes a user            
git secret removeperson email@example.com  

# prints all the currently added tracked files from the .gitsecret/paths/mapping.cfg
git secret list    

# deletes all the encrypted files                         
git secret clean -v  

# shows changes between the current version of hidden files and the ones already committed                     
git secret changes   

# Decrypts the file
git secret reveal

# Outputs to stdout the contents of the files named on the command line
git secret cat
```

<br>

