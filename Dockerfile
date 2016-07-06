FROM debian:jessie

MAINTAINER Test Maint


RUN apt-get update 
RUN apt-get install -y nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
RUN mkdir -p /var/cache/nginx/client_temp && chmod 777 /var/cache/nginx/client_temp

EXPOSE 80 443
USER root
CMD ["nginx", "-g", "daemon off;"]
