# Using this base image because of: https://github.com/openresty/docker-openresty/issues/124
FROM openresty/openresty:latest

# Add the configuration file
COPY nginx.conf /etc/nginx/conf.d/nginx.conf