FROM teddysun/xray:latest

# Copy your config file into the folder where Xray expects it
COPY config.json /etc/xray/config.json

# Tell Xray to start up automatically using your config file
CMD ["xray", "-config", "/etc/xray/config.json"]
