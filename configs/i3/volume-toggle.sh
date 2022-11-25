#!/bin/sh

VOLUME_FILE="${HOME}/.config/volume.backup"
VOLUME_DEVICE="vol"

CURRENT_VOLUME=$(mixer ${VOLUME_DEVICE} | awk '{print $7}' | cut -d ":" -f 1)

if [ ${CURRENT_VOLUME} -eq "0" ]; then
	if [ -f ${VOLUME_FILE} ]; then
		LAST_VOLUME=$(cat ${VOLUME_FILE})
	else
		# If the volume was 0 beforehand, this would cause a loop
		# in the script. Setting default volume to "50%". You can
		# adjust after. This is an edge case, but will happen.
		mixer ${VOLUME_DEVICE} 50
	fi
	mixer ${VOLUME_DEVICE} ${LAST_VOLUME}
else
	echo $CURRENT_VOLUME > ${VOLUME_FILE}
	mixer ${VOLUME_DEVICE} 0
fi
	
