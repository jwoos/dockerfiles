#!/usr/bin/env bash

docker run -it --rm \
	--name redis-standalone \
	-p 6379:6379 \
	tmp_redis
