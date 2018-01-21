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
QFILE='../lib/write_to_file.py';
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
	sleep 8
	echo "Folder(s) successfully created";
else
	echo "Folder already exists ...";
	echo "Skipping ...";
fi

echo "Getting Base Directory Path (BDP) ";
sleep 6
#TODO: Get the base directory
SERVBASE="$PWD";
BASEFILE="../basedir";
if [[ ! -f "$BASEFILE" ]]; then
	#TODO: Create the file 
	touch $BASEFILE;
	echo "$SERVBASE" > $BASEFILE;
	echo "Base Directory Path (BDP) successfully obtained";

else
	echo "Base Directory Path already exists ...";
	echo "$SERVBASE" > $BASEFILE;
	echo "Skipping ...";
fi





echo "Thank You !!";

