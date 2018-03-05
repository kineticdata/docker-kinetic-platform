FROM tomcat
RUN apt-get update; \
  apt-get install -y netcat

# Add the shell script used to determine when the postgres database is properly running/configured
# and ready for a connection
COPY ./wait-for-port.sh /wait-for-port.sh
RUN chmod +x /wait-for-port.sh

ARG VERSION=4.2.2
ADD https://s3.amazonaws.com/kineticdata.com/downloads/kinetic-task/${VERSION}/kinetic-task.war /usr/local/tomcat/webapps/kinetic-task.war