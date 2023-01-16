from golang:1.19-alpine

ENV http_proxy http://192.168.56.1:7890
ENV https_proxy http://192.168.56.1:7890
RUN apk add build-base

RUN go env -w GOPROXY=https://goproxy.cn
RUN go install github.com/go-delve/delve/cmd/dlv@latest

WORKDIR /app
EXPOSE 2345

#dlv debug [package] [flags]
ENTRYPOINT ["dlv", "debug", "--headless", "--listen=:2345", "--api-version=2", "--accept-multiclient", "--check-go-version=false"]
