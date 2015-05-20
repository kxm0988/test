#Nginx
FROM ubuntu:14.04

RUN \
  
  apt-get update && \
  apt-get install -y nginx 
  
COPY default /etc/nginx/sites-enabled/default

# nginx config

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
# Define working directory.
WORKDIR /etc/nginx
# expose both the HTTP (80) and HTTPS (443) ports
# Define default command.
CMD service nginx start
