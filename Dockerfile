FROM golang:latest as builder

WORKDIR /usr/src/app

COPY go.mod ./
COPY hello.go ./

RUN go build -v -ldflags "-s -w" -o . ./...

FROM scratch

WORKDIR /usr/app

COPY --from=builder /usr/src/app/hello .

ENTRYPOINT [ "./hello" ]