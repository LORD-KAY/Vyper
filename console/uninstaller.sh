#!/usr/bin/env bash
HOSTNAME=`hostname`;
HOSTIP=`hostname -I`;
FULLDATA=`uname`;

#TODO: Check if user wants to delete the library
echo "Do you really wants to uninstall the configuration :-> (Y/y|N/n)";
read RESPONSE;
if [[ $RESPONSE -eq 'Y' ]] || [[ $RESPONSE -eq 'y' ]]; then
    #TODO: Perform operation by uninstalling the app
    echo "Uninstallation will take few seconds, Please sit back and relax ... ";
elif [[ $RESPONSE -eq 'N' ]] || [[ $RESPONSE -eq 'n' ]]; then
    #TODO: Exist uninstalling operation
    exit;
fi
