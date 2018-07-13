ARG IMAGE_VERSION=8.5-jre8-alpine
FROM tomcat:${IMAGE_VERSION}

RUN apk --no-cache add git unzip zip

# Copy files
COPY files/ /
RUN chmod +x /*.sh

# Copy the kinetic request config from app-config to the dataDirectory on the container
COPY config /home/dataDirectory/config

ARG VERSION=2.1.0
ADD https://s3.amazonaws.com/kineticdata.com/downloads/kinetic-request-ce/${VERSION}/kinetic.war ${CATALINA_HOME}/webapps/kinetic.war

# Add shared-bundles to the web application
RUN mkdir -p /tmp/kinetic/app/shared-bundles/hydrogen-v1 \
  && cd /tmp/kinetic/app/shared-bundles/hydrogen-v1 \
  && echo 'Gitting bundles' \
  && git clone https://github.com/kineticdata/request-ce-bundle-spa.git -b webpack-v2 webpack-v2 \
  && git clone https://github.com/KineticCommunity/request-ce-kapp-admin.git -b master admin \
  && git clone https://github.com/KineticCommunity/request-ce-kapp-admin.git -b master space \
  && echo 'Add bundles to web app' \
  && cd /tmp/kinetic \
  && zip -r ${CATALINA_HOME}/webapps/kinetic.war app

WORKDIR ${CATALINA_HOME}

HEALTHCHECK --interval=90s --timeout=10s --start-period=30s --retries=3 \
  CMD [ "/bin/sh", "-c", "wget --quiet --tries=1 --spider http://localhost:8080/kinetic/app || exit 1" ]
