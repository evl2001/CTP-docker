#!/bin/bash

LOCALVOL="$1"

DOCKERFILEDIR=/home/xnat/dockerCTP/debian
cd ${DOCKERFILEDIR}

TAGID="idealctp/java_imageio:v1"

#Set local mount location
if [ -z "${LOCALVOL}" ]
then
	LOCALVOL=/home/xnat/dockerCTP/debian/DICOM
fi

#Container internal DirectoryStorageService
CONTAINERVOL=/install/CTP/roots/DirectoryStorageService

#Container ID
CONTAINERNAME=CTP_`date +%s`

docker build -t "${TAGID}" ./
docker run -v ${LOCALVOL}:${CONTAINERVOL} -p 2222:22 -p 2104:2104 -p 1090:1080 --rm --name ${CONTAINERNAME} idealctp/java_imageio:v1
