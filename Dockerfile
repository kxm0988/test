FROM ubuntu:14.04

# make sure apt is up to date
RUN apt-get update
RUN apt-get -y upgrade

# install , git, etc
RUN apt-get install -y git git-core wget zip

#Nginx
FROM nginx:1.7

RUN rm /etc/nginx/nginx.conf 

COPY nginx.conf /etc/nginx/nginx.conf


# nginx config
RUN sed -i -e"s/keepalive_timeout\s*65/keepalive_timeout 2/" /etc/nginx/nginx.conf
RUN sed -i -e"s/keepalive_timeout 2/keepalive_timeout 2;\n\tclient_max_body_size 100m/" /etc/nginx/nginx.conf
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
CMD service nginx start
