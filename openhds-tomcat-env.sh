# choose environment variables for tomcat
OPENHDS_FOLDER=~/OpenHDS
TOMCAT_FOLDER=$OPENHDS_FOLDER/openhds-tomcat
export CATALINA_HOME=$TOMCAT_FOLDER
export JAVA_HOME=/usr/lib/jvm/java-7-oracle

echo $TOMCAT_FOLDER
