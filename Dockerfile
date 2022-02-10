# Using this base image because of: https://github.com/openresty/docker-openresty/issues/124
FROM openresty/openresty:latest

# Add the configuration file
COPY default.conf /etc/nginx/conf.d/default.conf

COPY *.lua /etc/nginx/resty/
