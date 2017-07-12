FROM golang:1.9

EXPOSE 9292

WORKDIR /go
RUN go get -v github.com/p4tin/goaws/...

RUN mkdir -p /opt/app
RUN mv bin/cmd /opt/app/goaws

WORKDIR /opt/app

RUN rm -rf /go/src/* /go/bin/*

COPY custom.yaml .

ENTRYPOINT ["/opt/app/goaws"]
CMD ["-config=custom.yaml"]
