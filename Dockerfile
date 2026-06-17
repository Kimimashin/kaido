FROM alpine:latest

# Install Nginx and Xray core binaries
RUN apk add --no-cache nginx xray

# Copy your configuration files into place
COPY nginx.conf /etc/nginx/nginx.conf
COPY config.json /etc/xray/config.json

# Expose Nginx port
EXPOSE 8080

# Start both Xray and Nginx processes together
CMD ["sh", "-c", "xray -config /etc/xray/config.json & nginx -g 'daemon off;'"]
