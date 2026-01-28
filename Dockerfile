FROM alpine:3.22.1 AS cert-builder
RUN mkdir -p /usr/local/share/ca-certificates
COPY ext/pki/tls/*.crt /usr/local/share/ca-certificates
RUN apk --no-cache add ca-certificates && update-ca-certificates

FROM vikunja/vikunja:1.0.0
COPY --from=cert-builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs
