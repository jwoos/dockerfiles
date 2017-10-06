#!/usr/bin/env bash

# colors
COLOR_RED='\e[1;31m'
COLOR_BLUE='\e[1;34m'
COLOR_CYAN='\e[1;36m'
COLOR_GREEN='\e[1;32m'
COLOR_YELLOW='\e[1;33m'
COLOR_NC='\e[0m'

COMMAND=$1
DIRECTORY=$2
CACHE=${3:-true}
DIRECTORY_DASH=$(echo $DIRECTORY | sed 's/\//-/g')
DIRECTORY_UNDERSCORE=$(echo $DIRECTORY | sed 's/\//_/g')

function logOkay() {
	printf "${COLOR_GREEN}$@${COLOR_NC}\n"
}

function logWarning() {
	printf "${COLOR_YELLOW}$@${COLOR_NC}\n"
}

function logError() {
	printf "${COLOR_RED}$@${COLOR_NC}\n"
}

function run() {
	./$DIRECTORY/run.sh
}

function build() {
	local ARGS=''
	if [[ -z $CACHE || $CACHE == 'false' ]]; then
		ARGS='--no-cache'
	fi

	docker build "${DIRECTORY}" -t "tmp_${DIRECTORY_DASH}" $ARGS
}

function attach() {
	docker exec -it $(docker ps -q -f name="${DIRECTORY_DASH}-standalone") bash
}

function _kill() {
	docker kill "${DIRECTORY_DASH}-standalone"
}

if [[ -z $COMMAND ]]; then
	logError 'You must specify a command! [run | build | attach]'
	exit 1
fi

if [[ -z $DIRECTORY ]]; then
	logError 'You must specify a directory!'
	exit 1
fi

if [[ $COMMAND == 'run' ]]; then
	run
elif [[ $COMMAND == 'build' ]]; then
	build
elif [[ $COMMAND == 'attach' ]]; then
	attach
elif [[ $COMMAND == 'kill' ]]; then
	_kill
else
	logError 'Invalid command'
	exit 1
fi
