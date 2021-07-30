# tomb

### - installation [https://github.com/dyne/Tomb/blob/master/INSTALL.md]("https://github.com/dyne/Tomb/blob/master/INSTALL.md")

<br>

## **_commands_**
```bash
# create a 100MB tomb called “secret” do
# NOTE : name the tomb file as a Win8.vdi 
# or any other name to make it look like a regular file
tomb dig -s 100 secret.tomb
tomb forge secret.tomb.key
tomb lock secret.tomb -k secret.tomb.key

# open or mount the tomb
tomb open secret.tomb -k secret.tomb.key

# unmount or close the tomb
tomb close

# forcefull unmount (kills running opperations)
tomb slam all

# hide the key in a JPEG file (steghide package req)
tomb bury -k secret.tomb.key image.jpg

# extract key from a jpg file
tomb exhume -k secret.tomb.key image.jpg

```

<br>

