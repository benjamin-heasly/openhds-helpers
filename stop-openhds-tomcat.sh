# stop tomcat with correct environment
source openhds-tomcat-env.sh
echo "stopping OpenHDS Tomcat"
sudo $TOMCAT_FOLDER/bin/catalina.sh stop -force
sleep 4

