#!/bin/bash

# Update the web application and copy to Tomcat
#   - copy the source adapters to the data directory
#   - add the new kinetic-commons library and update the kinetic-oauth library
#   - delete the old kinetic-core library
mkdir -p /home/dataDirectory/consumers \
  && cd /tmp/kinetic-task \
  && unzip -oj /tmp/kinetic-task.war "WEB-INF/consumers/*" -d /home/dataDirectory/consumers \
  && zip -r /tmp/kinetic-task.war WEB-INF \
  && zip -d /tmp/kinetic-task.war WEB-INF/lib/kinetic-core-v1.jar \
  && mv /tmp/kinetic-task.war ${CATALINA_HOME}/webapps

cd ${CATALINA_HOME}

bin/catalina.sh run
