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
sleep 5