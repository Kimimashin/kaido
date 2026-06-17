# Use the official Nginx lightweight web server image
FROM nginx:alpine

# Copy a custom message directly into Nginx's default webpage folder
RUN echo '<h1>Welcome to Kimimashin Custom Docker App! Dev version 1.0</h1>' > /usr/share/nginx/html/index.html

# Tell Docker to open port 80 so we can view the website
EXPOSE 80
