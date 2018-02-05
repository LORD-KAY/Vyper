#!/bin/bash
HOSTNAME=`hostname`;
HOSTIP=`hostname -I`;
LOGDATA='../logs/logdata';

##TODO: DECLARATION OF THE SERVICES

#TODO: LINUX SPECIFIC -- RHEL,CENTOS,FEDORA
lAPACHE=$(pgrep httpd | wc -l);
lMySQL=$(pgrep mysqld | wc -l);
lNETMAN=$(pgrep network | wc -l);
##### DEBIAN DISTROS #####
#TODO: UBUNTU SPECIFIC -- ELEMENTARY,UBUNTU ..
uPULSE=$(pgrep pulseaudio | wc -l);
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

			#TODO: Check and start the service of pulse audio
			pavu=`pgrep pulseaudio`;
			if [[ "$pavu" == " " ]]; then
			    echo "Process ID Not Found for Pulse Audio. May be that is it is not installed " >> /dev/null 2>&1;
			else
			    if [[ "$uPULSE" -eq 0 ]]; then
			        echo "PULSE AUDIO background service for $HOSTNAME - $HOSTIP stopped at `date`" >> $LOGDATA;
			        echo "Attempting Repairs ..." >> $LOGDATA;
			        #TODO: service start will be here

			    fi
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
