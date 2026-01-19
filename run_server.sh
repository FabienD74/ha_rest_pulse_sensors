#!/bin/bash
VAR_HOST="ct-pulse.home"
VAR_API_KEY="f3b0243219206db7ad93a0cdb869cdc4f1cc3a3782feda7cb0563f63caa1ccc3"
VAR_PORT="7655"

VAR_API_HOST="http://${VAR_HOST}:${VAR_PORT}"

export VAR_API_HOST
export VAR_API_KEY

/usr/bin/ping -c1 ${VAR_HOST} >/dev/null
if [ $? -ne 0 ]; then
    echo "ping failed"
    exit 1
fi


while [ true ]
do
        echo " ===== BEGIN JSON ===== "
        bash /get_pulse_json.sh
        echo " ===== END JSON ===== "
        sleep 5

done
