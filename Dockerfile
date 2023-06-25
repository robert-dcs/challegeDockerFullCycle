FROM golang:1.20 as builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags '-w -s' -o app .

FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

CMD ["/app/app"]