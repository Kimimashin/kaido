FROM teddysun/xray:latest

# Install openssl to generate self-signed certificates
RUN apk add --no-cache openssl

# Create the directory structure for your certificates
RUN mkdir -p /etc/ssl/certs/

# Generate the self-signed certificate and private key files automatically
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/privkey.pem \
    -out /etc/ssl/certs/fullchain.pem \
    -subj "/CN=://firebase-settings.crashlytics.com"

# Copy your config file into the folder where Xray expects it
COPY config.json /etc/xray/config.json

# Tell Xray to start up automatically using your config file
CMD ["xray", "-config", "/etc/xray/config.json"]
