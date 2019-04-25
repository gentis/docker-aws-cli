#!/usr/bin/env bash

display_usage() {
    script=`basename "$0"`
	echo "Check if image already pulled"
	echo -e "\nUsage:\n${script} [arguments] \n"
}

if [  "$#" -ne 1 ]
then
    display_usage
    exit 1
fi

if [[ "$(docker images -q ${1} 2> /dev/null)" == "" ]]; then
    $(aws ecr get-login --no-include-email --region us-east-1)
    docker pull ${1}
else
    echo "Image already pulled"
fi
