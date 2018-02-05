#!/bin/bash
HOSTNAME=`hostname`;
HOSTIP=`hostname -I`;
LOGDATA='../logs/logdata';

##TODO: DECLARATION OF THE SERVICES
#TODO: UBUNTU SPECIFIC -- ELEMENTARY,UBUNTU ..
PULSEAUDIO=$(pgrep pulseaudio | wc -l);
#TODO: LINUX SPECIFIC -- RHEL,CENTOS,FEDORA
lAPACHE=$(pgrep httpd | wc -l);
lMySQL=$(pgrep mysqld | wc -l);
##### DEBIAN DISTROS #####
uAPACHE=$(pgrep apache2 | wc -l);
uMySQL=$(pgrep mysql | wc -l);
uNETMAN=$(pgrep NetworkManager | wc -l);

QFILE='../console/stt.txt';
if [[ -f "$QFILE" ]]; then
	for i in `cat $QFILE`
	do
		DISTRO=$i;
		if [[ "$DISTRO" -eq "elementary" ]] || [[ "$DISTRO" -eq "ubuntu" ]]; then
			#TODO: Check the status of MYSQL
			if [[ "$uMySQL" -eq 0 ]]; then
				echo "MySQL background service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting Mysql repairs" >> $LOGDATA;
				sudo service mysql start
			else
				echo "MySQL service for $HOSTNAME - $HOSTIP running smoothly" >> /dev/null 2>&1;
			fi

			#TODO: Check the status of apache2
			if [[ "$uAPACHE" -eq 0 ]]; then
				echo "APACHE background service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting apache2 repairs" >> $LOGDATA;
				sudo service apache2 start
			else
				echo "APACHE service for $HOSTNAME - $HOSTIP running smoothly" >> /dev/null 2>&1;
			fi

			#TODO: Check the status of network manager
			if [[ "$uNETMAN" -eq 0 ]]; then
				echo "System Network Manager service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting Repairs ..." >> $LOGDATA;
				service NetworkManager start
			else
				echo "System Network Manager service for $HOSTNAME - $HOSTIP running smoothly " >> /dev/null 2>&1;
			fi

		elif [[ "$DISTRO" -eq "centos" ]] || [[ "$DISTRO" -eq "rhel" ]] || [[ "$DISTRO" -eq "fedora" ]]; then
			#TODO: Check the status of the service
			if [[ "$lAPACHE" -eq 0 ]]; then
				echo "APACHE background service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting apache2 repairs" >> $LOGDATA;
				sudo service httpd start;
			else
				echo "APACHE service for $HOSTNAME - $HOSTIP running smoothly" >> /dev/null 2>&1;
			fi

			if [[ "$lMySQL" -eq 0 ]]; then
				echo "MySQL background service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
				echo "Attempting Mysql repairs" >> $LOGDATA;
				sudo service mysqld start;
			else
				echo "MySQL service for $HOSTNAME - $HOSTIP running smoothly" >> /dev/null 2>&1;
			fi
			
		fi
	done < "$QFILE";
fi
