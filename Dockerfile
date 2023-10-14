# Base image
FROM httpd:latest

# Copy web content
COPY index.html /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
