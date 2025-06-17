FROM n8nio/n8n:latest

USER root
RUN mkdir -p /data && chown -R node:node /data

USER node
WORKDIR /data

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

EXPOSE 5678
CMD ["n8n", "start"]
