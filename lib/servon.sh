#!/bin/bash
HOSTNAME=`hostname`;
HOSTIP=`hostname -I`;

MySQL=$(pgrep mysql | wc -l);
if [ "$MySQL" -eq 0 ]; 
then
	echo "MySQL service for $HOSTNAME stopped at `date`";
else
	echo "MySQL service for $HOSTNAME - $HOSTIP running smoothly";
fi