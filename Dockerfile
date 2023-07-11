# Base image
FROM httpd:latest

# Copy custom Apache2 configuration
COPY apache2.conf /usr/local/apache2/conf/httpd.conf

# Copy web content
COPY index.html /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
