#Nginx
FROM nginx:1.7
RUN \
  
  apt-get update && \
  apt-get install -y nginx 
  
RUN rm /etc/nginx/nginx.conf 

COPY nginx.conf /etc/nginx/nginx.conf


# nginx config

#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
CMD service nginx start
