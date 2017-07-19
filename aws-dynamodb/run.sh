#!/usr/bin/env bash

docker run -it --rm \
	--name aws-dynamodb-standalone \
	-p 9000:9000 \
	tmp_aws-dynamodb
