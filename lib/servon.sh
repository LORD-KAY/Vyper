#!/bin/bash
HOSTNAME=`hostname`;
HOSTIP=`hostname -I`;
LOGDATA='../logs/logdata';

## DECLARATION OF THE SERVICES
##### DEBIAN DISTROS #####
APACHE=$(pgrep apache2 | wc -l);
MySQL=$(pgrep mysql | wc -l);
NETMAN=$(pgrep NetworkManager | wc -l);

QFILE='../console/stt.txt';
if [[ -f "$QFILE" ]]; then
	for i in `cat $QFILE`
	do
		DISTRO=$i;
		if [[ "$DISTRO" -eq "elementary" ]] || [[ "$DISTRO" -eq "ubuntu" ]]; then
			#TODO: Check the status of MYSQL
			if [[ "$MySQL" -eq 0 ]]; then
				echo "MySQL background service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting Mysql repairs" >> $LOGDATA;
				sudo service mysql start
			else
				echo "MySQL service for $HOSTNAME - $HOSTIP running smoothly" >> /dev/null 2>&1;
			fi

			#TODO: Check the status of apache2
			if [[ "$APACHE" -eq 0 ]]; then
				echo "APACHE background service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting apache2 repairs" >> $LOGDATA;
				sudo service apache2 start
			else
				echo "APACHE service for $HOSTNAME - $HOSTIP running smoothly" >> /dev/null 2>&1;
			fi

			#TODO: Check the status of network manager
			if [[ "$NETMAN" -eq 0 ]]; then
				echo "System Network Manager service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting Repairs ..." >> $LOGDATA;
				service NetworkManager start
			else
				echo "System Network Manager service for $HOSTNAME - $HOSTIP running smoothly " >> /dev/null 2>&1;
			fi

		elif [[ "$DISTRO" -eq "centos" ]]; then
			#TODO: Check the status of the service
			if [[ "$APACHE" -eq 0 ]]; then
				echo "APACHE background service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting apache2 repairs" >> $LOGDATA;
				sudo systemctl start apache2;
			else
				echo "APACHE service for $HOSTNAME - $HOSTIP running smoothly" >> /dev/null 2>&1;
			fi

			if [[ "$MySQL" -eq 0 ]]; then
				echo "MySQL background service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting Mysql repairs" >> $LOGDATA;
				sudo systemctl start mysqld;
			else
				echo "MySQL service for $HOSTNAME - $HOSTIP running smoothly" >> /dev/null 2>&1;
			fi
			
		fi
	done < "$QFILE";
fi
