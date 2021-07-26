# git-secret

## pre-prerequisite
### - git
### - gpg
### - git-secret

<br>

## **_commands_**
### is used to print all the available commands
```git secret usage```  

<br>

### Initialize the repository if you have not done it already                          
```git init```  

<br>

### Initialize the repository using git-secret                              
```git secret init``` 

<br>

### Add a user                        
```git secret tell email@example.com```  

<br>

### Get a list of which users are attached on the repo        
```git secret whoknows```         

<br>

### Add a file on the encryption list
```git secret add file.txt```   

<br>

### Encrypt files of the list                  
```git secret hide```         

<br>

### deletes files from .gitsecret/paths/mapping.cfg, so they won’t be encrypted or decrypted in the future                   
```git secret remove file.txt```     

<br>

### removes a user            
```git secret removeperson email@example.com```  

<br>

### prints all the currently added tracked files from the .gitsecret/paths/mapping.cfg
```git secret list```    

<br>

### deletes all the encrypted files                         
```git secret clean -v```  

<br>

### shows changes between the current version of hidden files and the ones already committed                     
```git secret changes```   

<br>

### Decrypts the file
```git secret reveal```

<br>

### Outputs to stdout the contents of the files named on the command line
```git secret cat```

<br>

