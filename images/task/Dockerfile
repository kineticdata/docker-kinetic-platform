ARG IMAGE_VERSION=8.5-jre8-alpine
FROM tomcat:${IMAGE_VERSION}

RUN apk update \
  && apk add unzip zip

# Copy files
COPY files/ /
RUN chmod +x /*.sh

ARG VERSION=4.3.0-SNAPSHOT
ADD https://s3.amazonaws.com/kineticdata.com/downloads/kinetic-task/${VERSION}/kinetic-task.war /tmp/kinetic-task.war

HEALTHCHECK --interval=90s --timeout=10s --start-period=30s --retries=3 \
  CMD [ "/bin/sh", "-c", "wget --quiet --tries=1 --spider http://localhost:8080/kinetic-task/app/login || exit 1" ]

# execute /entrypoint.sh
CMD [ "sh", "-c", "/entrypoint.sh" ]
