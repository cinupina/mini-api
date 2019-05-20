# Build environment
FROM golang:1.12.5-alpine AS builder

WORKDIR /

COPY *.go .

RUN apk update && apk add upx
RUN adduser -D -g '' appuser
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -a -installsuffix cgo -o mini-api && upx mini-api

# Final image
FROM scratch

# Import from builder.
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /mini-api /bin/mini-api

# Use an unprivileged user.
USER appuser

EXPOSE 8080
ENTRYPOINT ["/bin/mini-api"]