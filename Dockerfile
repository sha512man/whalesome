FROM golang:latest AS build

LABEL maintainer="Dan Charousek <DanCharousek@gmail.com>"

WORKDIR /app

COPY ./src/lib/tpl .

# Build the Go app
RUN GOOS=linux GOARCH=amd64 go build -o main .

# ==========
FROM busybox

COPY ./src /opt/whalesome
COPY --from=build /app/main /opt/whalesome/bin/tpl
