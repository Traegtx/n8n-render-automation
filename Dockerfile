FROM n8nio/n8n:latest

# Switch to root to set up directories
USER root

# Create data directory and set permissions
RUN mkdir -p /data/.n8n && chown -R node:node /data

# Switch back to node user
USER node

# Set working directory
WORKDIR /home/node

# Set environment variables for n8n
ENV N8N_USER_FOLDER=/data/.n8n
ENV DB_TYPE=sqlite
ENV DB_SQLITE_DATABASE=/data/.n8n/database.sqlite

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:5678/healthz || exit 1

# Expose port
EXPOSE 5678

# Start n8n using the full path
CMD ["/usr/local/bin/n8n", "start"]
