# Vyper
Vyper is a library that monitors the various services running at the background of your system and provide fixes if it can as well as crash reports. Some of the services include mysql,apache2,mariadb-service and others.

# How to Use the Library
 - [x] Either Clone or Download the repository from ```https://github.com/LORD-KAY/Service-Monitor```
 - [x] eg. ```git clone https://github.com/LORD-KAY/Service-Monitor.git```
 - [x] Extract it to your favorite directory i.e It being your Document, Home Directory etc.
 - [x] After Extraction - The Structure looks like this 
   ``` Service-Monitor/
         console/
           starter.sh
           uninstaller.sh
         lib/
          servon.sh
          variables.py
          write_to_file.py
         test/
          ..Contains the test files
         .gitignore
         .LICENSE
         .README.md
        ```
  - [x] Navigate to the console folder and run the `starter.sh` as a super user or simple as root.
  	```sudo ./starter.sh```
  - [x] After the installation completes, Thats it you are good to go.
  - [x] The Library will monitor the services every minute to check it status and provide fixes if possible
  - [x] It will create a copy of the log file and send it to the user through email ***
  - [x] To View logs, Navigate to the logs/ folder created when the installation was in progress and open the logdata file to see the log files i.e if there is any
  - [x] To Uninstall run `sudo ./uninstaller.sh` file in the console folder to revert all changes

# Background services implemented
## Application Services
 - [x] Network Manager
 - [x] Pulse Audio (Ubuntu Specific)
## Server Services
 - [x] MySQL
 - [x] Apache2 - The latest version of apache

# Platform Support
 - [x] Debian eg.Ubuntu , elementary etc.
 - [x] Linux eg. CentOs, Red Hat (RHEL) , Fedora
 
# Upcoming Release
 - [x] Mailer live - Notification master
 
# Release
 - [x] Pre-release Now Out
 - [x] Stable release to be out soon

# Contribution 

# More Features
 - Just Getting Started with the library
# Contacts
 - [x] [ Github Repository ] https://github.com/LORD-KAY/Vyper
 - [x] [ Email Address ] offeilord@gmail.com
