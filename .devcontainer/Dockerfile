FROM bitnami/nginx:1.27

ARG APP_ROOT=/app
ARG APP_USER=vscode
ARG APP_GROUP=vscode
ARG APP_UID=1001
ARG APP_GID=1001
# *** Key: Hard-code the agent folder in Docker environment ***
#ENV VSCODE_AGENT_FOLDER=/.vscode/.vscode-server

USER root

RUN echo "Installing cron" && \
    install_packages ca-certificates curl && \
    echo "Adding the group" && \
    addgroup --gid ${APP_GID} ${APP_GROUP} && \
    echo "Adding the user" && \
    useradd --create-home --shell /bin/bash --uid ${APP_UID} --gid ${APP_GID} ${APP_USER} && \
    echo "Adding user to the additional groups" && \
    usermod -aG www-data ${APP_USER} && \
    echo "Creating .vscode folder" && \
    mkdir -p /.vscode && \
    mkdir -p /.vscode-server && \
    chown -R ${APP_USER}:${APP_GID} /.vscode && \
    chown -R ${APP_USER}:${APP_GID} /.vscode-server && \
    echo "Done"
     
# Copy servers.conf virtualhost
COPY --chown=root nginx.conf.d/website.conf /opt/bitnami/nginx/conf/server_blocks/website.conf

# Switch back to non-priv user (in the base container we have: uid=1001 gid=0(root) groups=0(root))
USER ${APP_USER}:0
