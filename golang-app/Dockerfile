FROM golang:latest

WORKDIR /app
COPY main.go .
COPY go.mod .

RUN go build -o app .

EXPOSE 8080

CMD ["./app"]
