#!/bin/sh

VOLUME_FILE="${HOME}/.config/volume.backup"
VOLUME_DEVICE="vol"

CURRENT_VOLUME=$(mixer ${VOLUME_DEVICE} | awk '{print $7}')
METHOD=$1
DELTA=$2

if [ ! "$#" -eq 2 ]; then
	echo "Not enough arguments. Example: ./script up 1"
	exit 1
fi 

if [ -f ${VOLUME_FILE} ]; then
	LAST_VOLUME=$(cat ${VOLUME_FILE})

	if [ ${LAST_VOLUME} -gt 100 ]; then
		LAST_VOLUME=100
	elif [ ${LAST_VOLUME} -lt 0 ]; then
		LAST_VOLUME=0
	fi
else
	LAST_VOLUME=0
fi

if [ ${METHOD} = "up" ]; then
	TARGET_VALUE=$(echo $LAST_VOLUME+$DELTA | bc)
	mixer ${VOLUME_DEVICE} ${TARGET_VALUE}
elif [ ${METHOD} = "down" ]; then
	TARGET_VALUE=$(echo $LAST_VOLUME-$DELTA | bc)
	mixer ${VOLUME_DEVICE} ${TARGET_VALUE}
fi

echo "${TARGET_VALUE}" > ${VOLUME_FILE}
