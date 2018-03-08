ARG IMAGE_VERSION=9.1.9.0-jdk-alpine
FROM jruby:${IMAGE_VERSION}

RUN apk update \
  && apk add ca-certificates git

# JRuby options
ENV JAVAXMX="256m"

# define the kinetic platform directory
ENV KINETIC_PLATFORM_DIR=/usr/local/kinetic

# platform environment variables
ENV SPACE_NAME="Playground"
ENV SPACE_SLUG="playground"
ENV IMPORT_OVERWRITE="false"
ENV IMPORT_TYPE="all"

# Copy all files
COPY files/ /
RUN chmod +x /usr/local/bin/*.sh

# set the working directory
WORKDIR ${KINETIC_PLATFORM_DIR}

# Git the kinetic-sdk-rb and platform-template repositories
RUN git config --global http.sslVerify false \
  && git clone https://github.com/kineticdata/kinetic-sdk-rb.git vendor/kinetic-sdk-rb \
  && git clone https://github.com/kineticdata/platform-template.git exports/platform_template

# execute /usr/local/bin/setup.sh
CMD [ "sh", "-c", "setup.sh" ]
