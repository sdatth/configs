# clamav

## **commands**
```bash
# update virus signature database
sudo freshclam

# run the scan
clamscan -r /path/to/scan

# remove the virus file if found
clamscan -r --remove /path/to/scan

# ring a bell if virus found
clamscan -r --bell -i /path/to/scan

# more options
clamscan -r --log=/path/to/store/log-file --move=/path/to/store/infected/file /path/to/scan
```
