#!/bin/bash
VAR_API_HEALTH="/api/health"
VAR_API_VERSION="/api/version"
VAR_API_STATE="/api/state"



#########################################################
### function to call API and return JSON
call_api () {
        L_URL="$1"
        L_RESPONSE="$(curl -s -H "X-API-TOKEN: ${VAR_API_KEY}"  ${VAR_API_HOST}${L_URL} )"
        echo "${L_RESPONSE}"
}
#########################################################


RESPONSE="$( call_api ${VAR_API_VERSION})"
#echo " CONTENT OF RESPONSE: ${RESPONSE}"
echo "${RESPONSE}" | jq --tab -f jq_filter_version.txt
#echo "Version = ${V_VERSION}"


RESPONSE="$( call_api ${VAR_API_STATE})"
#echo " CONTENT OF RESPONSE: ${RESPONSE}"
echo "${RESPONSE}" | jq --tab -f jq_filter_state.txt
#echo "Version = ${V_VERSION}"

~                                                                                                      
