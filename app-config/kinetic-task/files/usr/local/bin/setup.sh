#!/bin/bash

# Extract the consumers to the data directory and move the webapp to Tomcat
mkdir -p /home/dataDirectory/consumers \
  && unzip -oj /tmp/kinetic-task.war "WEB-INF/consumers/*" -d /home/dataDirectory/consumers \
  && mv /tmp/kinetic-task.war /usr/local/tomcat/webapps

bin/catalina.sh run