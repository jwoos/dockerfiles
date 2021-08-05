FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
	apt upgrade -y && \
	apt install -y texlive-full make vim

ENTRYPOINT /bin/bash
CMD []
