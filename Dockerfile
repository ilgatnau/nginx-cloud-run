# Using this base image because of: https://github.com/openresty/docker-openresty/issues/124
FROM openresty/openresty:1.19.9.1-5-bullseye

# Add the configuration file
COPY default.conf /etc/nginx/conf.d/default.conf

COPY ./lib/resty/ /etc/nginx/resty/

#RUN ls -ltr /etc/nginx/resty/
