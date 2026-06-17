# Step 1: Use Alpine to safely generate the certificates without errors
FROM alpine:latest AS cert-builder
RUN apk add --no-cache openssl
RUN mkdir -p /etc/ssl/certs/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/privkey.pem \
    -out /etc/ssl/certs/fullchain.pem \
    -subj "/CN=://firebase-settings.crashlytics.com.com"

# Step 2: Use the official Xray image and copy the files over
FROM teddysun/xray:latest
COPY --from=cert-builder /etc/ssl/certs/ /etc/ssl/certs/
COPY config.json /etc/xray/config.json
CMD ["xray", "-config", "/etc/xray/config.json"]
