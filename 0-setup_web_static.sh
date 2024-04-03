#!/usr/bin/env bash
<<<<<<< HEAD
# sets up web servers for the deployment of web_static
apt-get update
apt-get -y install nginx
ufw allow 'Nginx HTTP'
mkdir -p /data/web_static/releases/
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
echo "<h1>Hello World</h1>" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test /data/web_static/current
chown -R ubuntu:ubuntu /data/
config_content="
server{
    listen 80 default_server;
    listen [::]:80 default_server;
    add_header X-Served-By $HOSTNAME;

    server_name _;

    location /hbnb_static {
        alias /data/web_static/current;
        index index.html index.htm;
    }

    error_page 404 /404.html;
        location /404 {
                root /var/www/html;
                internal;
    }

}"
echo "$config_content" > /etc/nginx/sites-available/default
sudo service nginx restart
=======
# Prepare web server for deployment
apt-get -y update
apt-get -y install nginx
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu:ubuntu /data/
grep -q "location /hbnb_static" /etc/nginx/sites-available/default || \
sed -i "/^}/i \ \n\tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t\tautoindex off;\n\t}" /etc/nginx/sites-available/default
service nginx restart
>>>>>>> f3ba4e8a98d4c501c88412c0d71d7d7e7fc63a05
