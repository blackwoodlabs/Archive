#!/bin/bash
###Install Docker-Compose
# Download the current stable release of Docker Compose (at time of writing 2022-01-15):
curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# Apply executable permissions to the binary:
sudo chmod +x /usr/local/bin/docker-compose
# Create symbolic link
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
