FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
	apt upgrade -y && \
	apt install -y texlive-full=2019.20191208-4ubuntu2 make vim

ENTRYPOINT /bin/bash
CMD []
