FROM nginx
USER root
COPY static-html /usr/share/nginx/html
USER default
