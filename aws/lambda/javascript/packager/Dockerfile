# Lambda uses 2016.03 but there is only 2016.09 on dockerhub
FROM amazonlinux:2016.09

# install deps
RUN yum -y install gcc zlib zlib-devel openssl openssl-devel xz

ENV NODEJS_VERSION=v6.11.1
ENV NODEJS_HASH=e68cc956f0ca5c54e7f3016d639baf987f6f9de688bb7b31339ab7561af88f41

WORKDIR /

ADD https://nodejs.org/dist/${NODEJS_VERSION}/node-${NODEJS_VERSION}-linux-x64.tar.xz .
RUN echo "${NODEJS_HASH} node-${NODEJS_VERSION}-linux-x64.tar.xz" > node-${NODEJS_VERSION}-linux-x64.tar.xz.sum && \
	sha256sum -c node-${NODEJS_VERSION}-linux-x64.tar.xz.sum && \
	tar -xJvf node-${NODEJS_VERSION}-linux-x64.tar.xz && \
	rm -rf node-${NODEJS_VERSION}-linux-x64.tar.xz node-${NODEJS_VERSION}-linux-x64.tar.xz.sum

ENV PATH="${PATH}:node-${NODEJS_VERSION}-linux-x64/bin"
