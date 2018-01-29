#!/usr/bin/env bash
HOSTNAME=`hostname`;
HOSTIP=`hostname -I`;
FULLDATA=`uname`;

###TODO: files configs
SERVBASE="$PWD";
BASEFILE="../basedirpath";

##TODO: Check if user wants to delete the library
read -p  "Do you really wants to uninstall the configuration :-> (Y/y|N/n)" RESPONSE;
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
     fi
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

