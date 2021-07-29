# fd

## **_commands_**
```bash

# help
fd --help

# search using filename
fd filename

# search files which end for example with "jpeg"
fd jpeg$

# find file which starts with something say "bbb"
fd ^bbb

# find based on extentions 
fd -e pdf

# find hidden folders and content
fd -H .zsh

# search a file in a dir
fd passwd /etc

# search by --type -t
# f: File.
# d: Directory.
# l: Symbolic link.
# x: Executable file.
# e: Empty file.

fd -tf filename
fd -td dirname

```

<br>


