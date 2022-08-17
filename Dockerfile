FROM golang:1.18-alpine as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o /usr/src/app/hello

FROM scratch
COPY --from=builder /usr/src/app/hello /app

CMD ["/app"]