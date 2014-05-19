# Utility to pull down new versoin of OpenHDS server, build, and redeploy.
# Assumes run from the folder with this and other OpenHDS helper scripts.
# Assumes Maven project for server is located in ../openhds-server
# Assumes Tomcat is located in ../apache-tomcat-6.0.37

HELPER_DIR=`pwd`
PROJECT_DIR=$HELPER_DIR/../openhds-server
APACHE_DIR=$HELPER_DIR/../apache-tomcat-6.0.37

./stop-tomcat-6.sh

# update the server code
cd $PROJECT_DIR
git stash
git pull
git stash apply

# redeploy the server with custom database config
cp -f $HELPER_DIR/database.properties $PROJECT_DIR/web/src/main/resources
mvn clean install
sudo rm -rf $APACHE_DIR/webapps/openhds
cp -f $PROJECT_DIR/web/target/openhds.war $APACHE_DIR/webapps/

# try to save space
mvn clean

# lay down baseline OpenHDS data
cd $HELPER_DIR
./apply-openhds-baseline-data bsh-bioko-baseline.sql

./restart-tomcat-6.sh
