# https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html
FROM openjdk:8

EXPOSE 8000

RUN mkdir -p /opt/app/archive
WORKDIR /opt/app

RUN apt-get update && \
	apt-get install -y bash && \
	apt-get upgrade -y && \
	rm -rf /var/lib/apt/lists/*

ADD https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz archive/
ADD https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz.sha256 archive/dynamodb_local_latest.tar.gz.sum

WORKDIR /opt/app/archive

RUN sha256sum -c dynamodb_local_latest.tar.gz.sum
RUN tar -xzvf dynamodb_local_latest.tar.gz

WORKDIR /opt/app/

RUN mv -v archive/DynamoDBLocal.jar . && \
	mkdir DynamoDBLocal_lib/ && \
	mv -v archive/DynamoDBLocal_lib/* ./DynamoDBLocal_lib/ && \
	rm -rf archive/

ENTRYPOINT java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
