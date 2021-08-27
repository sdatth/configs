# crontab

### - /etc/crontab: system-wide crontab
### - NOTE : use absolute paths of executables when using a command

<br>

## commands
```bash
# lists all crontab for the current user
crontab -l

# edits the crontab file for the current user
crontab -e

# edits the crontab file of root (-u flag is to specify user)
sudo crontab -u root -e

## configuration
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed

# the below cronjob runs at 5:30 on 25th july , it prints "this is a cron job" to a test file
30  17  25  7   7   /usr/bin/bash echo "This is a cron job" > ~/Downloads/"test file $(date)"

# the below cronjob runs at 5:30 on 25th every month , it prints "this is a cron job" to a test file
30  17  25  *   *   /usr/bin/bash echo "This is a cron job" > ~/Downloads/"test file $(date)"

# runs the job daily
@daily              /usr/bin/bash echo "This is an daily cronjob" > /home/anony/Downloads/testfile.txt

# runs the job hourly
@hourly              /usr/bin/bash echo "This is an hourly cronjob" > /home/anony/Downloads/testfile.txt
```

<br>
