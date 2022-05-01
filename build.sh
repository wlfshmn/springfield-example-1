#!/bin/bash
set -e

mvn clean verify

VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:evaluate -Dexpression=project.version | grep -v '\[' | grep -v 'Download')

docker build . -t docker-dev.dc.teliacompany.net/examples/springfield-example:${VERSION}
