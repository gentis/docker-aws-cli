#!/usr/bin/env bash

display_usage() {
    script=`basename "$0"`
	echo "Build docker image that contains docker and aws cli"
	echo -e "\nUsage:\n${script} [arguments] \n"
}

if [  "$#" -ne 1 ]
then
    display_usage
    exit 1
fi

docker build -t "hireme/docker-aws-cli:${1}" .
docker login --username ${USERNAME} --password ${PASSWORD}
docker push hireme/docker-aws-cli:${1}