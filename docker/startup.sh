#!/usr/bin/env bash
set -e

echo GGID=$GGID GGROUP=$GGROUP

groupadd -g $GGID $GGROUP
useradd -u $GUID -s $GSHELL -c $GUSERNAME -g $GGID -M -d $GHOME $GUSERNAME
usermod -a -G sudo $GUSERNAME
echo $GUSERNAME:docker | chpasswd
#su -p -l $GUSERNAME
cd $GPWD
su -w GDISPLAY,GUSERNAME,GUID,GGROUP,GGID,GHOME,GSHELL,GRUNXTERM,GPWD $GUSERNAME
#/bin/bash

#cd $GPWD
#usermod -u `id -u ${USER}` micropython
#groupmod -g `id -g ${USER}` micropython

#. $IDF_PATH/export.sh

#exec "$@"

