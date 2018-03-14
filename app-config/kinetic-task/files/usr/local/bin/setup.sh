#!/bin/bash

# Create the data directory,
# Copy the consumers to the data directory,
# Move the webapp to Tomcat
mkdir -p /home/dataDirectory/consumers \
  && unzip -oj /tmp/kinetic-task.war "WEB-INF/consumers/*" -d /home/dataDirectory/consumers \
  && pushd /tmp/kinetic-task \
  && zip -r /tmp/kinetic-task.war WEB-INF \
  && zip -d /tmp/kinetic-task.war WEB-INF/lib/kinetic-core-v1.jar \
  && popd \
  && mv /tmp/kinetic-task.war /usr/local/tomcat/webapps

bin/catalina.sh run