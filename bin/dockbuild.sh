#!/bin/bash

declare DOCKER_TAG=rikvermeer/esp-idf-docker

EXPORT_DIR="$( cd $( dirname ${BASH_SOURCE:-$0}); pwd -P )"
source $EXPORT_DIR/export.sh

docker build -t="$DOCKER_TAG" $DOCKER_DIR 
