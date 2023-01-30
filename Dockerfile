FROM golang:1.15-alpine AS builder

WORKDIR /usr/src/app

COPY main.go ./

RUN GOOS=linux go build -o /usr/src/app/main -ldflags='-s -w' .

FROM scratch

WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/main ./main

ENTRYPOINT [ "./main" ]