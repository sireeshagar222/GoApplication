FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o /my-go-app

FROM alpine:latest

WORKDIR /

COPY --from=builder /GoApplication /GoApplication

EXPOSE 8080

CMD ["/GoApplication"]
