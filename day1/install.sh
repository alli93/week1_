#!/bin/bash

PROGNAME=$(basename $0)

# An error exit function
error_exit()
{
	error_log="./logs/error_log.txt" # Location of error log
	
	# log directory check
	if [ ! -d logs ]
	then
		mkdir logs
	fi

	# log file check
	if [ ! -f "${error_log}" ]
	then
		touch $error_log
		chmod 755 $error_log
	fi

	printf "$1\n$2\n$hline" 1>&2 >> $error_log
	exit 1
}

hline="####################################################################################\n"
# Store and display start-of-script date and time
datetime_start=$(date)
printf "Start of execution: $datetime_start\n"

# Welcome message
printf "Welcome $USER\n"
printf "This script will install all necessary development programs and dependencies for the HGOP course\n"

printf "$hline"

# Store and display linux distribution information
LINUX_VERSION=$(grep -E '^(NAME|VERSION)' /etc/os-release)
printf "OS info:\n$LINUX_VERSION\n"

printf "$hline"

# Continue installation prompt
read -p "Would you like to continue (y/Y)? " CONTINUE_INSTALLATION

# Abort installation if CONTINUE_INSTALLATION is not (y/Y)
if [[ $CONTINUE_INSTALLATION != "y" ]] && [[ $CONTINUE_INSTALLATION != "Y" ]]
then
	printf "Aborting installation...\n"
	exit 1
fi

printf "Installation start...\n"

# Ensure apt-get is set to work with HTTP sources
sudo apt-get -y install apt-transport-https

# Add packages to the apt-key index
key="Sublime Text 3"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - || error_exit "$datetime_start" "Line $LINENO: Failure on downloading $package $key apt-get key"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list || error_exit "$datetime_start" "$LINENO: Failure on adding $key key to APT key management utility"

# Synchronize package index
sudo apt-get -y update	|| error_exit "$datetime_start" "$LINENO: Failure on synchronizing apt-get package index" 

# Install packages
package="Sublime Text 3"
sudo apt-get install -y sublime-text  || "$datetime_start" "$LINENO: Failure on installing $package"
package="Git"
sudo apt-get install -y git || "$datetime_start" "$LINENO: Failure on installing $package"

# Store and display end-of-script date and time
datetime_end=$(date)
printf "End of execution: $datetime_end\n"
printf "Elapsed run-time: $SECONDS seconds\n"

