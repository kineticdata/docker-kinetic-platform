ARG IMAGE_VERSION=8.5-jre8-alpine
FROM tomcat:${IMAGE_VERSION}

RUN apk update \
  && apk add unzip

# Add the shell script used to determine when the cassandra database is properly running/configured
# and ready for a connection
COPY ./wait-for-port-to-close.sh /wait-for-port-to-close.sh
RUN chmod +x /wait-for-port-to-close.sh

# Copy the kinetic request config from app-config to the dataDirectory on the container
COPY ./kinetic-request-ce/config /home/dataDirectory/config

ARG VERSION=2.0.4
ADD https://s3.amazonaws.com/kineticdata.com/downloads/kinetic-request-ce/${VERSION}/kinetic.war /usr/local/tomcat/webapps/kinetic.war