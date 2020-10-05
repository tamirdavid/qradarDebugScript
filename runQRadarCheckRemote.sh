#!/bin/bash

if [ "$1" != "" ]; then
   scp qradarCheck.sh root@$1:/
   ssh root@$1 /qradarCheck.sh
else
   ssh root@$colleecho 'Enter Qradar Server IP:'
   read collector
   scp qradarCheck.sh root@$collector:/
   ssh root@$collector /qradarCheck.sh
fi


