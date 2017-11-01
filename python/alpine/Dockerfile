FROM alpine:3.6

RUN apk add --no-cache --virtual .initial \
	alpine-sdk \
	bash \
	build-base \
	clang \
	curl \
	gcc \
	gnupg \
	libarchive \
	linux-headers \
	make \
	ncurses-dev \
	openssl \
	openssl-dev \
	sqlite-dev \
	tar \
	xz \
	yaml \
	zip

RUN ./versions.sh

ENTRYPOINT /bin/bash
CMD []
