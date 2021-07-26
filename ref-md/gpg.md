# gpg

### short notations
```
# -a  --armor
# -b  --detach-sign
# -d  --decrypt
# -e  --encrypt
# -k  --list-keys
# -K  --list--secret-keys
# -o  --output
# -r  --recipient
# -s  --sign
```

<br> 

## **_commands_**
### generating key
```
gpg --full-generate-key
```
<br> 

### listing keys
```
gpg --list-keys
gpg --list-secret-keys
gpg --list-keys --keyid-format long
gpg --list-sigs   # list signatures
gpg --fingerprint # list fingerprints
gpg --fingerprint --fingerprint
```
<br> 

### editing keys
```
gpg --edit-key <key-id>
```
<br> 

### backup
```
gpg --export-secret-keys --output private-key.asc --armor <key-id>
gpg --export --armor --output some-public.key <key-id>
```
<br> 

### importing
```
gpg --import some.key
```
<br> 

### encrypting & decrypting a file
```
# short version
gpg -e -r <key-id> <file>
gpg -e -a -r <key-id> <file>  # for armor version
gpg -o <file.asc> -e -a -r <key-id> <file>

# long version
gpg --encrypt --recipient <key-id> <file>
gpg --encrypt --armor --recipient <key-id> <file>
gpg --output <file> --encrypt --armor --recipient <key-id> <file>

# decrypting a file
gpg -d <file> > file
```
<br> 

### signing files
```
# detach sign
gpg --armor --detach-sign <file>  # long version
gpg -a -b <file>                  # short version

# verifying detached sign 
gpg --verify <signed-file>
gpg --verify <detached-signature-file> <corresponding-content-file>

# normal sign (while performing normal sign, the file is embedded in the signature file) & data can be extracted using public keys by anyone
gpg --armor --sign --recipient <key-id> <file>
gpg -a -s <file>
gpg --output <file> --armor --sign --recipient <key-id> <file>
gpg -o <file> -a -s -r <key-id> <file>

# verifiying normal sign
gpg --verify <signed-file> 
gpg -d <signed-file> > file   # to extract file from a signature (only possible in normal sign)
```
<br> 

### misc 
```
# deleting
gpg --delete-keys <key ID>
gpg --delete-secret-keys <key ID>

# signing others public key
gpg --sign-key <key ID>
```