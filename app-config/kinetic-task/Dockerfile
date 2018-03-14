ARG IMAGE_VERSION=8.5-jre8-alpine
FROM tomcat:${IMAGE_VERSION}

RUN apk update \
  && apk add unzip zip

# Copy all files
COPY files/ /
RUN chmod +x /usr/local/bin/*.sh

ARG VERSION=4.2.2
ADD https://s3.amazonaws.com/kineticdata.com/downloads/kinetic-task/${VERSION}/kinetic-task.war /tmp/kinetic-task.war

# execute /usr/local/bin/setup.sh
CMD [ "sh", "-c", "setup.sh" ]
