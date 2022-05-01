#!/usr/bin/env bash

# Start the java application
mkdir -p /media/logs/"${K8S_POD_NAME}" && ln -s /media/logs/"${K8S_POD_NAME}" "${HOME}"/logs

if [[ "${DEBUGGING}" == "true" ]]; then
  JAVA_OPTS="${JAVA_OPTS} -agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n"
fi

# Start the java application
cd "$HOME" || exit
exec java ${JAVA_OPTS} org.springframework.boot.loader.JarLauncher
