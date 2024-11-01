# Use the Python base image
FROM python:alpine

# Create a working directory
WORKDIR /app

# Copy the entry script to the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entry command
ENTRYPOINT ["/entrypoint.sh"]
