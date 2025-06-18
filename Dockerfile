FROM n8nio/n8n:latest

# Switch to root to create directories
USER root

# Create data directory and set proper permissions
RUN mkdir -p /data/.n8n && \
    chown -R node:node /data && \
    chmod -R 755 /data

# Switch back to node user
USER node

# Set working directory
WORKDIR /data

# Expose port
EXPOSE 5678

# Use the default entrypoint and command from the base image
# This ensures n8n starts correctly with the right environment
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["n8n"]
