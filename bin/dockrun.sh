#!/bin/bash

## The docker image to use
declare DOCKER_TAG=rikvermeer/esp-idf-docker

## Find the bin dir and source the export.sh file in there
EXPORT_DIR="$( cd $( dirname ${BASH_SOURCE:-$0}); pwd -P )"
source $EXPORT_DIR/export.sh

## 
export GDISPLAY=unix/$DISPLAY
export GUSERNAME=`id -u -n`
export GUID=`id -u`
export GGROUP=`id -g -n`
export GGID=`id -g`
export GHOME=$HOME
export GSHELL=$SHELL
export GRUNXTERM=0
export GPWD=`pwd`

echo -e "\nSetting the following exports for the docker container:"
echo GDISPLAY=$GDISPLAY
echo GUSERNAME=$GUSERNAME
echo GUID=$GUID
echo GGROUP=$GGROUP
echo GGID=$GGID
echo GHOME=$GHOME
echo GSHELL=$GSHELL
echo GRUNXTERM=$GRUNXTERM
echo GPWD=$GPWD

exit 0

BOARD=TEST
PRJ=/home/micropython/micropython/ports/esp32
BUILD=/home/micropython/build
IDF="idf.py -C ${PRJ} -B ${BUILD}/build-${BOARD} -D MICROPY_BOARD=${BOARD}"
TARGET=build
DEF_CMD="${IDF} ${TARGET}"
echo "Default command is:"
echo ${DEF_CMD}
CMD=${@:-${DEF_CMD}}

docker run --rm -it \
	-v $HOME:$HOME -v /tmp/.X11-unix:/tmp/.X11-unix \
	-e BOARD=${BOARD} -e PRJ=${PRJ} -e BUILD=${BUILD} \
	-e GUSERNAME=$GUSERNAME -e GUID=$GUID -e GGROUP=$GGROUP \
	-e GGID=$GGID -e GHOME=$GHOME -e GSHELL=$GSHELL \
	-e GRUNXTERM=$GRUNXTERM -e GPWD=$GPWD \
       ${DOCKER_TAG} ${CMD}
#       -u $(id -u ${USER}):$(id -g ${USER}) \
#       ${DOCKER} ${CMD}
#       ${DOCKER} bash

#       -v $PWD:${BUILD} \
#       -v $PWD/boards/TEST:${PRJ}/boards/TEST \
