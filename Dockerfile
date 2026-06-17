FROM alpine:latest

# Install Nginx, curl, and certificates
RUN apk add --no-cache nginx curl ca-certificates

# Download and install official Xray core binary
RUN curl -L -H "Cache-Control: no-cache" -o /tmp/xray.zip https://github.com && \
    unzip /tmp/xray.zip -d /usr/local/bin/ && \
    rm -rf /tmp/xray.zip /usr/local/bin/README.md /usr/local/bin/LICENSE

# Copy your configuration files into place
COPY nginx.conf /etc/nginx/nginx.conf
COPY config.json /etc/xray/config.json

# Expose Nginx port
EXPOSE 8080

# Start both Xray and Nginx processes together
CMD ["sh", "-c", "/usr/local/bin/xray -config /etc/xray/config.json & nginx -g 'daemon off;'"]
