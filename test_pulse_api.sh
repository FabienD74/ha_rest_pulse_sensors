#!/bin/bash
VAR_API_KEY="f3b0243219206db7ad93a0cdb869cdc4f1cc3a3782feda7cb0563f63caa1ccc3"
VAR_HOST="http://ct-pulse:7655"

VAR_API_HEALTH="/api/health"
VAR_API_VERSION="/api/version"
VAR_API_STATE="/api/state"
VAR_API_CHARTS="/api/charts?range=1s"
VAR_API_CHARTS_1H="/api/charts?range=1h"

#########################################################
### function to call API and return JSON
call_api () {
        L_URL="$1"
        L_RESPONSE="$(curl -s -H "X-API-TOKEN: ${VAR_API_KEY}"  ${VAR_HOST}${L_URL} | jq )"
        echo "${L_RESPONSE}"
}
#########################################################


RESPONSE="$( call_api ${VAR_API_VERSION})"
#echo "${RESPONSE}"
#V_VERSION=$( echo "${RESPONSE}" | jq .version)
#echo "Version = ${V_VERSION}"

RESPONSE="$( call_api ${VAR_API_STATE})"
#echo "${RESPONSE}"
V_STATE="$( echo "${RESPONSE}" | jq -f test_pulse_api.filter)"
echo "${V_STATE}"

#RESPONSE=($( call_api ${VAR_API_HEALTH}))
#echo "health = ${RESPONSE}"

RESPONSE=($( call_api ${VAR_API_CHARTS_1H}))
#echo "Charts 1h = ${RESPONSE}"
#V_DATA=$( echo "${RESPONSE}" | jq )
#echo "${V_DATA}"
