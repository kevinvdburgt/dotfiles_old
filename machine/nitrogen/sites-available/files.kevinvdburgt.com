server {
  listen 80;
  listen [::]:80;

  server_name files.kevinvdburgt.com;
  
  include snippets/letsencrypt-acme-challenge.conf;
  
  location / {
    return 301 https://files.kevinvdburgt.com$request_uri;
  }
}

server {
  listen 443 ssl;
  listen [::]:443 ssl;

  server_name files.kevinvdburgt.com;

  ssl on;
  ssl_certificate /etc/letsencrypt/live/files.kevinvdburgt.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/files.kevinvdburgt.com/privkey.pem;
  include snippets/letsencrypt-ssl-params.conf;

  root /var/www/files.kevinvdburgt.com;
  index index.html;

  charset utf-8;
  error_page 404 /theme/404.html;
  try_files $uri.html $uri $uri/ =404;

  #auth_basic "Closed for public access";
  #auth_basic_user_file /etc/nginx/passwd/files.kevinvdburgt.com;

  location / {
    fancyindex on;
    fancyindex_exact_size off;
    fancyindex_header /theme/header.html;
    fancyindex_footer /theme/footer.html;
    fancyindex_css_href /theme/style.css;
    fancyindex_time_format "%B %e, %Y";
    fancyindex_ignore "theme";
  }
}

