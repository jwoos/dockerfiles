#!/usr/bin/env bash

docker run -it --rm \
	--name aws-sns-standalone \
	-p 9292:9292 \
	tmp_aws-sns
