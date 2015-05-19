#Nginx
FROM ubuntu:14.04

RUN \
  
  apt-get update && \
  apt-get install -y nginx 
  
RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types

COPY nginx.conf /etc/nginx/nginx.conf

COPY default /etc/nginx/sites-enabled/default

# nginx config

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443

CMD service nginx start
