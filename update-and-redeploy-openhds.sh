# Utility to pull down new versoin of OpenHDS server, build, and redeploy.
source openhds-tomcat-env.sh

# update the server code
cd $SOURCE_FOLDER
git pull
git checkout biokoForms

# lay down project configuration 
cp -f $HELPERS_FOLDER/codes.properties $SOURCE_FOLDER/web/src/main/resources/
cp -f $HELPERS_FOLDER/database.properties $SOURCE_FOLDER/web/src/main/resources
cp -f $HELPERS_FOLDER/location-levels.properties $SOURCE_FOLDER/web/src/main/resources
cp -f $HELPERS_FOLDER/site-config.properties $SOURCE_FOLDER/controller/src/main/resources
cp -f $HELPERS_FOLDER/value-constraint.xml $SOURCE_FOLDER/domain/src/main/resources

# rebuild and redeploy the webapp
mvn clean install -DskipTests
sudo rm -rf $TOMCAT_FOLDER/webapps/openhds*
cp -f $SOURCE_FOLDER/web/target/openhds.war $TOMCAT_FOLDER/webapps/

