#!/bin/bash

LOCALVOL="$1"

DOCKERFILEDIR=/home/xnat/dockerCTP/debian
cd ${DOCKERFILEDIR}

#Set local mount location
if [ -z "${LOCALVOL}" ]
then
	LOCALVOL=/home/xnat/dockerCTP/debian/DICOM
fi

#Container internal DirectoryStorageService
CONTAINERVOL=/home/CTP/install/CTP/roots/DirectoryStorageService

docker build -t debian-CTP ./
docker run -d -v ${LOCALVOL}:${CONTAINERVOL} -P --rm
