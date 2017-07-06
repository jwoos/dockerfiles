#!/usr/bin/env bash

COMMAND=$1
DIRECTORY=$2

function run() {
	./$DIRECTORY/run.sh
}

function build() {
	docker build "${DIRECTORY}" -t "tmp_${DIRECTORY}"
}

function attach() {
	docker exec -it $(docker ps -q -f name="${DIRECTORY}-standalone") bash
}

function _kill() {
	docker kill "${DIRECTORY}-standalone"
}

if [[ -z $COMMAND ]]; then
	echo 'You must specify a command! [run | build | attach]'
	exit 1
fi

if [[ -z $DIRECTORY ]]; then
	echo 'You must specify a directory!'
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
	echo 'Invalid command'
	exit 1
fi
