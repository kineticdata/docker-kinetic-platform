ARG IMAGE_VERSION=8.5-jre8-alpine
FROM tomcat:${IMAGE_VERSION}

# Copy files
COPY files/ /
RUN chmod +x /*.sh

ARG VERSION=1.2.0
ADD https://s3.amazonaws.com/kineticdata.com/downloads/kinetic-bridgehub/${VERSION}/kinetic-bridgehub.war ${CATALINA_HOME}/webapps/kinetic-bridgehub.war

HEALTHCHECK --interval=90s --timeout=10s --start-period=30s --retries=3 \
  CMD [ "/bin/sh", "-c", "wget --quiet --tries=1 --spider http://localhost:8080/kinetic-bridgehub/app/login || exit 1" ]
