# shenanigans

## prerequisites (packages required)
### - lolcat (display something colourful)
### - figlet (display text using special chars)
### - fortune (tells fortune)
### - cowsay (displays text inside an object)

<br>

## commands
```bash
# ASCII display  
echo "Hello world" | figlet | lolcat

# shows available formats to display some text (ex: cow, elephant)
cowsay -l

# display text using a one of the format from above command
echo "Text here" | cowsay -f elephant

# display random fortune phrases on every execution
fortune | cowsay -f tux
```

<br>
