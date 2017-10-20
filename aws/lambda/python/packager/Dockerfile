# Lambda uses 2016.03 but there is only 2016.09 on dockerhub
FROM amazonlinux:2016.09

# install deps
RUN yum -y install gcc gcc zlib zlib-devel openssl openssl-devel

ENV PYTHON_VERSION=3.6.1
ENV PYTHON_HASH=aa50b0143df7c89ce91be020fe41382613a817354b33acdc6641b44f8ced3828

WORKDIR /

# install python
ADD https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz .
RUN echo "${PYTHON_HASH} Python-${PYTHON_VERSION}.tgz" > Python-${PYTHON_VERSION}.tgz.sum && \
	sha256sum -c Python-${PYTHON_VERSION}.tgz.sum && \
	tar -xzvf Python-${PYTHON_VERSION}.tgz && \
	cd Python-${PYTHON_VERSION} && \
	./configure && \
	make && \
	make install && \
	cd .. && \
	rm Python-${PYTHON_VERSION}.tgz Python-${PYTHON_VERSION}.tgz.sum
