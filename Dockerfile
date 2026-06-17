FROM teddysun/xray:latest

# Install nginx on top of the official xray image
RUN apk add --no-cache nginx

# Copy your configuration files into place
COPY nginx.conf /etc/nginx/nginx.conf
COPY config.json /etc/xray/config.json

# Expose port and start both services
EXPOSE 8080
CMD ["sh", "-c", "xray -config /etc/xray/config.json & nginx -g 'daemon off;'"]
