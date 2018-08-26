FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
	apt upgrade -y && \
	apt install -y texlive-full=2017.20180305-1 make vim

ENTRYPOINT /bin/bash
CMD []
