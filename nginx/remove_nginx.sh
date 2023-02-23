#!/bin/bash
echo "stopping service"
sudo systemctl stop nginx
echo "purging nginx from the system"
sudo apt purge nginx nginx-common nginx-core -y
echo "clearning up the file system"
### ensure directories removed
if [ -d "/etc/nginx" ]  
then
    echo "ERROR: Directory /etc/nginx  was NOT removed." 
else
    echo "****passed.....Directory /path/to/dir has been removed"
fi

if [ -d "/usr/share/nginx/" ]
then
    echo "ERROR: Directory /usr/share/nginx/ was NOT removed."
else
    echo "****passed......Directory /path/to/dir has been removed"
fi

##Ensure service is not running and removed
echo verifing service has been removed...
RES=$(systemctl status nginx 2>&1)

if [[ ${RES} == "Unit nginx.service could not be found." ]]
then 
	echo  "****passed: service nginx has been removed"

else
	echo "****failed: service nginx has not ben removed see log.txt"
	echo "check log.txt"
fi
echo ${RES} > log.txt
echo ${RES} > ngstatus.txt
echo "script completed"
