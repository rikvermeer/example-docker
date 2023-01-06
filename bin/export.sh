#!/bin/bash

## Find directories from current, relative, context and get their absolute paths
declare -x CUR_DIR=${PWD}
declare -x COMMAND="${BASH_SOURCE:-$0}"
declare -x SCRIPT_DIR="$( cd "$(dirname $COMMAND)" ; pwd -P )"
declare -x SCRIPT="$(basename $COMMAND)"
declare -x PROJECT_DIR="$( cd ${SCRIPT_DIR}/..; pwd -P)"
declare -x DOCKER_DIR="${PROJECT_DIR}/docker"

echo -e "\nFound the following relative context:"
echo CUR_DIR=$CUR_DIR
echo COMMAND=$COMMAND

echo -e "\nAbsolute context:"
echo SCRIPT_DIR=$SCRIPT_DIR
echo SCRIPT=$SCRIPT

echo -e "\nFound the following (absolute) directories:"
echo PROJECT_DIR=$PROJECT_DIR
echo DOCKER_DIR=$DOCKER_DIR

source $PROJECT_DIR/docker-tag-export.sh
echo DOCKER_TAG=$DOCKER_TAG

## Find current user id/name, group id/name so a container can bind to them 
declare -x GUID=$(id -u)
declare -x GUSERNAME=$(id -u -n)
declare -x GGID=$(id -g)
declare -x GGROUP=$(id -g -n)
# current path and home dir
declare -x GPWD=$PWD
declare -x GHOME=$HOME
# optional: shell and display
declare -x GSHELL=$SHELL
declare -x GDISPLAY=unix/$DISPLAY

echo -e "\nFound the following user information:"
echo GUID=$GUID
echo GUSERNAME=$GUSERNAME
echo GGID=$GGID
echo GGROUP=$GGROUP
echo GHOME=$GHOME
echo GPWD=$GPWD

echo -e "\nFound the following additional info:"
echo GSHELL=$GSHELL
echo GDISPLAY=$GDISPLAY
