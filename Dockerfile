FROM bitnami/nginx:1.27

# Copy project into /app
COPY webapp /app

# Copy servers.conf virtualhost
COPY nginx.conf.d/website.conf /opt/bitnami/nginx/conf/server_blocks/website.conf


