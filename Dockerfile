FROM n8nio/n8n:latest

# Just create the data directory - that's it!
USER root
RUN mkdir -p /data/.n8n && chown -R node:node /data
USER node

# Use the exact same startup as the original image
