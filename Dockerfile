#Nginx
FROM ubuntu:14.04

RUN \
  
  apt-get update && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get install -y nginx 
  
RUN rm /etc/nginx/nginx.conf 

COPY nginx.conf /etc/nginx/nginx.conf

COPY default /etc/nginx/sites-enabled/default

# nginx config

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
# Define working directory.
WORKDIR /etc/nginx
# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443
# Define default command.
CMD ["nginx"]
