# start tomcat with correct environment
source openhds-tomcat-env.sh
./stop-openhds-tomcat.sh
echo "starting OpenHDS Tomcat"
sudo $TOMCAT_FOLDER/bin/catalina.sh jpda start

# stream the Tomcat output
tail -f $TOMCAT_FOLDER/logs/catalina.out

