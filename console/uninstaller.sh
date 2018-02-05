#!/usr/bin/env bash
APPNAME="Vyper v1.0.0-beta";
HOSTNAME=`hostname`;
HOSTIP=`hostname -I`;
FULLDATA=`uname`;

###TODO: files configs
SERVBASE="$PWD";
BASEFILE="../basedirpath";
QDIR="../logs";
WTFILE="os.txt";
TIMER=100;
counter=0;
##TODO: Check if user wants to delete the library
read -p "Do you really wants to uninstall these configurations :-> (Y/y|N/n)" RESPONSE;
case $RESPONSE in
     [Yy]* )
     #TODO;Perform operation by uninstalling the app
     echo "Uninstallation will take few seconds, Please sit back and relax ...";
     sleep 2
     echo "Performing Removal of Scheduled Jobs ...";
     #TODO: executing the job removal
     crontab -r
     sleep 2
     echo "Removing Base Directory Path And Its Related Files ..."
     if  [[ -f $BASEFILE ]]; then
         #TODO: delete the file and its content --> PWD
         sleep 3
         rm $BASEFILE;
         echo "Path Successfully Removed ..."
     else
        echo "No Existence of Base Directory Path and Its Related Files ..."
        echo "Skipping ...";
     fi
     sleep 2
     echo "Removing The Created Required Folder(s) ...";
     if [[ -d $QDIR ]]; then
        sleep 1
        rm -R $QDIR;
        echo "Folder(s) Successfully Removed ...";
     else
        echo "No Existence of Created Folder(s) ...";
        echo "Skipping ...";
     fi
     sleep 1
     echo "Removing Created Baseline ...";
     if [[ -f "$WTFILE" ]]; then
         rm $WTFILE;
     else
        echo "No Existence of base os filename" > /dev/null 2>&1; #This is to silence the output cos the file is vital
     fi
     sleep 2
     echo "Baseline Uninitialized ..";
     sleep 1
     echo "$APPNAME Successfully Uninstalled ...";
     echo "Thank You For Using It."
     ;;
     [Nn]* )
     #TODO:Exit uninstalling operation
     exit;;
     * )
     echo "Incorrect Input Made ..";
     sleep 1
     echo "Program Terminating ...";
     sleep 4
     echo "Program Terminated";
esac

