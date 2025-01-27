FROM golang:1.20.14-alpine3.18

WORKDIR /app

COPY . .

RUN go build -o app

EXPOSE 8081

CMD ["./app"]