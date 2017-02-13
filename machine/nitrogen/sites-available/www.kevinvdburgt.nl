server {
  listen 80;
  listen [::]:80;

  server_name www.kevinvdburgt.nl kevinvdburgt.nl;

  return 301 https://kevinvdburgt.com/$request_uri;
}
