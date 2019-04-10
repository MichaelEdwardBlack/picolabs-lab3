#!bin/bash
VARIABLE_FILE="raise_event_variables.txt"
source ${VARIABLE_FILE}
OLD_HOST=${HOST}
OLD_PORT=${PORT}
OLD_ECI=${ECI}
OLD_EID=${EID}
OLD_DOMAIN=${DOMAIN}
OLD_TYPE=${TYPE}

if [ $# = 0 ]; then
  URL="http://${HOST}:${PORT}/sky/event"
  CURL_COMMAND="${URL}/${ECI}/${EID}/${DOMAIN}/${TYPE}"
  NEXT_EID=$(expr $OLD_EID + 1)
  sed -i "s/EID=${OLD_EID}/EID=${NEXT_EID}/g" ${VARIABLE_FILE}

  echo "USING COMMAND:"
  echo "${CURL_COMMAND}"
  echo ""
  echo "RESPONSE:"
  curl ${CURL_COMMAND}
  echo ""

else
  while [ "$1" != "" ]; do
  	case $1 in
  		### set the host ip address ###
  		-host | --set_host)
  			shift
        command="s/${OLD_HOST}/$1/g"
  			sed -i ${command} ${VARIABLE_FILE}
  			;;
      ### set the port number ###
      -port | --set_port)
        shift
        command="s/${OLD_PORT}/$1/g"
        sed -i ${command} ${VARIABLE_FILE}
        ;;
      -eci | --set_eci)
        shift
        command="s/${OLD_ECI}/$1/g"
        sed -i ${command} ${VARIABLE_FILE}
        ;;
      -eid | --set_eid)
        shift
        command="s/${OLD_EID}/$1/g"
        sed -i ${command} ${VARIABLE_FILE}
        ;;
      -domain | --set_domain)
        shift
        command="s/${OLD_DOMAIN}/$1/g"
        sed -i ${command} ${VARIABLE_FILE}
        ;;
      -type | --set_type)
        shift
        command="s/${OLD_TYPE}/$1/g"
        sed -i ${command} ${VARIABLE_FILE}
        ;;
  		-h | --help)
  			echo "Usage: $0 [option...] {variable_name}"
  			;;
  		-*)
  			echo "Invalid arguments!"
  			echo "	-h, --help for help"
  			;;
  	esac
  	shift
  done
  bash $0
fi
