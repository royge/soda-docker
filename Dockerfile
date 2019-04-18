FROM golang as builder

WORKDIR /go/src/app

ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=0

RUN go get github.com/gobuffalo/pop/...
RUN go install github.com/gobuffalo/pop/soda

FROM alpine:3.8
RUN apk --no-cache add ca-certificates

WORKDIR /root/

# Copy soda binary
COPY --from=builder /go/bin/soda /usr/bin/
