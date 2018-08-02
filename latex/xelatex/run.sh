#!/usr/bin/env bash

docker run -it --rm \
	--name xelatex-standalone \
	-p 3306:3306 \
	tmp_xelatex
