#!/bin/bash

# Install Nginx if not already installed
if ! command -v nginx &> /dev/null; then
    sudo apt-get update
    sudo apt-get -y install nginx
fi

# Create necessary directories if they don't exist
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared

# Create a fake HTML file for testing
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html > /dev/null

# Create or recreate symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

# Set ownership recursively
sudo chown -R ubuntu:ubuntu /data/

# Update Nginx configuration
nginx_config="/etc/nginx/sites-available/default"
sudo sed -i '/^}/i \\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' $nginx_config

# Restart Nginx
sudo service nginx restart

exit 0

