#!/usr/bin/env bash

docker run -it --rm \
	--name aws-sqs-standalone \
	-p 9324:9324 \
	tmp_aws-sqs
