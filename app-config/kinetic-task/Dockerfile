ARG IMAGE_VERSION=8.5-jre8-alpine
FROM tomcat:${IMAGE_VERSION}

RUN apk update \
  && apk add unzip zip

# Copy files
COPY files/ /
RUN chmod +x /*.sh

ARG VERSION=4.2.2
ADD https://s3.amazonaws.com/kineticdata.com/downloads/kinetic-task/${VERSION}/kinetic-task.war /tmp/kinetic-task.war

# Update the web application and copy to Tomcat
#   - copy the source adapters to the data directory
#   - add the new kinetic-commons library and update the kinetic-oauth library
#   - delete the old kinetic-core library
RUN mkdir -p /home/dataDirectory/consumers \
  && unzip -oj /tmp/kinetic-task.war "WEB-INF/consumers/*" -d /home/dataDirectory/consumers \
  && cd /tmp/kinetic-task \
  && zip -r /tmp/kinetic-task.war WEB-INF \
  && zip -d /tmp/kinetic-task.war WEB-INF/lib/kinetic-core-v1.jar \
  && mv /tmp/kinetic-task.war ${CATALINA_HOME}/webapps

WORKDIR ${CATALINA_HOME}

HEALTHCHECK --interval=90s --timeout=10s --start-period=30s --retries=3 \
  CMD [ "/bin/sh", "-c", "wget --quiet --tries=1 --spider http://localhost:8080/kinetic-task/app/login || exit 1" ]
