FROM phusion/baseimage:0.9.22

RUN apt-get update && \
	apt-get install -y chromium-browser nodejs xvfb && \
	apt-get upgrade -y && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/sbin/my_init", "--skip-startup-files", "--skip-runit", "--"]
CMD ["bash"]
