server {
  listen 80;
  listen [::]:80;

  server_name kevinvdburgt.com www.kevinvdburgt.com;
  
  include snippets/letsencrypt-acme-challenge.conf;
  
  location / {
    return 301 https://kevinvdburgt.com$request_uri;
  }
}

server {
  listen 443 ssl;
  listen [::]:443 ssl;

  server_name kevinvdburgt.com;

  ssl on;
  ssl_certificate /etc/letsencrypt/live/www.kevinvdburgt.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/www.kevinvdburgt.com/privkey.pem;
  include snippets/letsencrypt-ssl-params.conf;

  root /var/www/html;
  index index.html;

  location / {
    try_files $uri $uri/ =404;
  }
}

