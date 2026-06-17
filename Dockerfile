# Use a lightweight official image containing the Xray proxy network core engine
FROM teddysun/xray:latest

# Copy your custom NetMod config settings directly into the Xray configuration folder
COPY config.json /etc/xray/config.json

# Expose port 80 for the inbound WebSocket tunneling traffic
EXPOSE 80

# Launch the network core automatically using your custom rules
CMD ["xray", "-config", "/etc/xray/config.json"]
