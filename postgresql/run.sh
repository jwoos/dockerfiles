#!/usr/bin/env bash

docker run -it --rm \
	--name postgresql-standalone \
	-p 5432:5432 \
	tmp_postgresql
