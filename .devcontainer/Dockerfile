FROM bitnami/nginx:1.27

ARG APP_ROOT=/app
ARG APP_USER=vscode
ARG APP_GROUP=vscode
ARG APP_UID=1001
ARG APP_GID=1001

USER root

#add vscode user
RUN echo "Adding the group" && \
    addgroup --gid ${APP_GID} ${APP_GROUP} && \
    echo "Adding the user" && \
    useradd --home-dir ${APP_ROOT} --shell /bin/bash --uid ${APP_UID} --gid ${APP_GID} ${APP_USER} && \
    echo "Adding user to the additional groups" && \
    usermod -aG www-data ${APP_USER}
     
# Copy servers.conf virtualhost
COPY --chown=root nginx.conf.d/website.conf /opt/bitnami/nginx/conf/server_blocks/website.conf

# Switch back to non-priv user
USER ${APP_USER}
