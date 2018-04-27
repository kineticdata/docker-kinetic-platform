ARG IMAGE_VERSION=8.5-jre8-alpine
FROM tomcat:${IMAGE_VERSION}

# Copy files
COPY files/ /
RUN chmod +x /*.sh \
  && mkdir -p /home/dataDirectory/files

ARG VERSION=1.2.0
ADD https://s3.amazonaws.com/kineticdata.com/downloads/kinetic-filehub/${VERSION}/kinetic-filehub.war ${CATALINA_HOME}/webapps/kinetic-filehub.war

HEALTHCHECK --interval=90s --timeout=10s --start-period=30s --retries=3 \
  CMD [ "/bin/sh", "-c", "wget --quiet --tries=1 --spider http://localhost:8080/kinetic-filehub/app/login || exit 1" ]
