FROM tomcat
RUN apt-get update; \
  apt-get install -y netcat

# Add the shell script used to determine when the cassandra database is properly running/configured
# and ready for a connection
COPY ./wait-for-port-to-close.sh /wait-for-port-to-close.sh
RUN chmod +x /wait-for-port-to-close.sh

ARG VERSION=1.2.0
ADD https://s3.amazonaws.com/kineticdata.com/downloads/kinetic-filehub/${VERSION}/kinetic-filehub.war /usr/local/tomcat/webapps/kinetic-filehub.war