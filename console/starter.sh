#!/bin/bash
HOSTNAME=`hostname`;
HOSTIP=`hostname -I`;

echo "Welcome To Service Monster
Follow the instructions to enjoy the library";
echo "-----------------------------------------------";

echo "You are running this `basename $0` file in order to 
establish a baseline for the library to work on.
Failure to do so will result in the library not working
---------------------------------------------------------
";

sleep 2
echo "Initializing the baseline now .....";
QFILE='../lib/pf_data.py';
python $QFILE;

sleep 3
echo "Baseline initialized ....";

sleep 1
echo "Creating required folder(s) ....";
QDIR='../logs';
if [[ ! -d "$QDIR" ]]; then
	sleep 1
	mkdir $QDIR;
	sleep 1
	cd $QDIR;
	sleep 1
	touch logdata
else
	return
fi
sleep 8
echo "Folder(s) successfully created";
echo "Thank You !!";

