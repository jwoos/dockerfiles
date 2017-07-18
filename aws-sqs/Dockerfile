FROM openjdk:8

EXPOSE 9324

RUN apt-get update && \
	apt-get install -y bash && \
	apt-get upgrade -y && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/app/archive
WORKDIR /opt/app

ENV ELASTICMQ_VERSION=0.13.8
ENV ELASTICMQ_HASH=4da26072322f9015e6ff1fa07a4eaabc90bc24bcc2d1be2454db6902491e16d8

RUN apt-get update && apt-get install apt-transport-https

# install sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
	apt-get update && \
	apt-get install sbt && \
	rm -rf /var/lib/apt/lists/*

ADD https://github.com/adamw/elasticmq/archive/release-${ELASTICMQ_VERSION}.tar.gz archive/
RUN echo "${ELASTICMQ_HASH} archive/release-${ELASTICMQ_VERSION}.tar.gz" > archive/release-${ELASTICMQ_VERSION}.tar.gz.sum
RUN sha256sum -c archive/release-${ELASTICMQ_VERSION}.tar.gz.sum
RUN tar -zxvf archive/release-${ELASTICMQ_VERSION}.tar.gz

WORKDIR /opt/app/elasticmq-release-${ELASTICMQ_VERSION}

RUN sbt 'project elasticmq-server' assembly
RUN mv server/target/scala-2.12/elasticmq-server-assembly-${ELASTICMQ_VERSION}.jar /opt/app

WORKDIR /opt/app

# clean up
RUN rm -rf elasticmq-release-${ELASTICMQ_VERSION} archive

COPY custom.conf .
COPY connector.py .

ENTRYPOINT /usr/bin/java -Dconfig.file=custom.conf -jar /opt/app/elasticmq-server-assembly-${ELASTICMQ_VERSION}.jar
CMD ["-help"]
