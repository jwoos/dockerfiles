#!/usr/bin/env bash

docker run -it --rm \
	--name latex-standalone \
	--volume $(pwd):/opt \
	tmp_latex
