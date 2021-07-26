# shenanigans

## prerequisites (packages required)
### - lolcat (display something colourful)
### - figlet (display text using special chars)
### - fortune (tells fortune)
### - cowsay (displays text inside an object)

<br>

## **_commands_**
### ASCII display  
```echo "Hello world" | figlet | lolcat```

<br>

### shows available formats to display some text (ex: cow, elephant)
```cowsay -l```

<br>

### display text using a one of the format from above command
```echo "Text here" | cowsay -f elephant```

<br>

### display random fortune phrases on every execution
```fortune | cowsay -f tux```

<br>
