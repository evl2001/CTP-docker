#!/bin/bash

LOCALVOL="$1"

#DOCKERFILEDIR=/home/xnat/dockerCTP/alpine
DOCKERFILEDIR=${PWD}
cd ${DOCKERFILEDIR}

TAGID="idealctp/java_imageio:alpine"

#Set local mount location
if [ -z "${LOCALVOL}" ]
then
	LOCALVOL=${DOCKERFILEDIR}/DICOM
fi

sudo chmod -R 777 ${LOCALVOL}
sudo chown -R ${USER}:${USER} ${LOCALVOL}

#Container internal DirectoryStorageService
CONTAINERVOL=/install/CTP/roots/DirectoryStorageService

#Container ID
CONTAINERNAME=CTP_alpine_`date +%s`

#docker build -t "${TAGID}" ./
docker run -v ${LOCALVOL}:${CONTAINERVOL} -p 2104:2104 -p 7104:7104 -p 1090:1080 --rm --name ${CONTAINERNAME} ${TAGID}
