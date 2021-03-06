ARG IMAGE_VERSION=9.1.9.0-jdk-alpine
FROM jruby:${IMAGE_VERSION}

RUN apk --no-cache add ca-certificates gettext git

ENV HOST_PORT=8080

# JRuby options
ENV JAVAXMX="256m"

# define the kinetic platform directory
ENV KINETIC_PLATFORM_DIR=/usr/local/kinetic

# platform environment variables
ENV SDK_LOG_LEVEL="info"
ENV SPACE_NAME="Playground"
ENV SPACE_SLUG="playground"
ENV SPACE_USER_USERNAME="kdadmin"
ENV SPACE_USER_PASSWORD="admin"
ENV IMPORT_OVERWRITE="false"
ENV IMPORT_TYPE="all"
ENV TASK_OAUTH_ENDPOINT_SERVER="http://localhost:${HOST_PORT}/kinetic"
ENV TASK_OAUTH_REDIRECT_ENDPOINT_SERVER="http://localhost:${HOST_PORT}/kinetic-task"

# Copy files
COPY files/ /
RUN chmod +x /*.sh

# set the working directory
WORKDIR ${KINETIC_PLATFORM_DIR}

# Git the kinetic-sdk-rb and platform-template repositories
RUN git clone https://github.com/kineticdata/kinetic-sdk-rb.git vendor/kinetic-sdk-rb \
  && git clone https://github.com/kineticdata/platform-template.git exports/platform-template

# execute /entrypoint.sh
CMD [ "sh", "-c", "/entrypoint.sh" ]
