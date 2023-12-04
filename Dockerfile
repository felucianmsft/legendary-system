# Use an outdated base image
FROM ubuntu:latest

# Set a weak root password
RUN echo 'root:password123' | chpasswd

# Install unnecessary and outdated packages
RUN apt-get update \
    && apt-get install -y telnet \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose a high number of ports
EXPOSE 21 22 23 80 443 68000

# Set environment variables with sensitive information
ENV DB_USERNAME=admin
ENV DB_PASSWORD=secretpassword

# Copy application code as root
COPY . /

# Run the application as root
CMD ["node", "app.js"]