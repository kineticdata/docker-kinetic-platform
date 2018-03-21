#!/bin/bash

if [ -z "${KINETIC_PLATFORM_DIR}" ]; then
  echo "ERROR: The environment variable \"KINETIC_PLATFORM_DIR\" must be set."
  exit 100
fi
if [ -z "${SPACE_NAME}" ]; then
  echo "ERROR: The environment variable \"SPACE_NAME\" must be set."
  exit 101
fi
if [ -z "${SPACE_SLUG}" ]; then
  echo "ERROR: The environment variable \"SPACE_SLUG\" must be set."
  exit 102
fi
if [ -z "${IMPORT_TYPE}" ]; then
  IMPORT_TYPE="all"
  export IMPORT_TYPE
fi
if [ -z "${IMPORT_OVERWRITE}" ]; then
  IMPORT_OVERWRITE="false"
  export IMPORT_OVERWRITE
fi
if [ -z "${JAVAXMX}" ]; then
  JAVAXMX="256m"
  export JAVAXMX;
fi

cd ${KINETIC_PLATFORM_DIR}/vendor/kinetic-sdk-rb \
  && git pull origin master \
  && cd ${KINETIC_PLATFORM_DIR}/exports/platform_template \
  && git pull origin master

cd ${KINETIC_PLATFORM_DIR}

# copy the import-environment script from the updated SDK
cp vendor/kinetic-sdk-rb/samples/import-export/import-environment.rb .

# update the config.yaml template file with specific environment variables
envsubst '
${TASK_OAUTH_ENDPOINT_SERVER}
${TASK_OAUTH_REDIRECT_ENDPOINT_SERVER}
${SDK_LOG_LEVEL}
${SPACE_USER_USERNAME}
${SPACE_USER_PASSWORD}
' < config/config.yaml > config/runtime.yaml

# run the import driver script
jruby -J-DXmx${JAVAXMX} import-environment.rb \
  -e platform_template \
  -s ${SPACE_SLUG} \
  -n ${SPACE_NAME} \
  -c runtime.yaml \
  -o ${IMPORT_OVERWRITE} \
  -t ${IMPORT_TYPE}

echo -e "\n---------------------------------------------------------------------"
echo -e "\tThe \"${SPACE_NAME}\" space is ready at http://localhost:${HOST_PORT}"
echo -e "---------------------------------------------------------------------\n"
