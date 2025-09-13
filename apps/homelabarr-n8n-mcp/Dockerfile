# HomelabARR n8n-MCP Container
# Based on https://github.com/smashingtags/n8n-mcp
# Integration of n8n workflow automation with Model Context Protocol

# Use multi-stage build from upstream
FROM node:22-alpine AS builder

WORKDIR /app

# Clone and build from our fork
RUN apk add --no-cache git && \
    git clone https://github.com/smashingtags/n8n-mcp.git . && \
    npm install && \
    npm run build

# Runtime stage
FROM ghcr.io/smashingtags/homelabarr-alpine:latest

# HomelabARR labels
LABEL org.opencontainers.image.source="https://github.com/smashingtags/homelabarr-containers"
LABEL org.opencontainers.image.description="HomelabARR n8n-MCP - Model Context Protocol for n8n workflow automation"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="homelabarr-n8n-mcp"
LABEL org.opencontainers.image.vendor="HomelabARR CLI"

# Install Node.js and runtime dependencies
RUN apk add --no-cache \
    nodejs \
    npm \
    curl \
    su-exec && \
    rm -rf /var/cache/apk/*

WORKDIR /app

# Copy built application from builder
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/data ./data
COPY --from=builder /app/src/database/schema-optimized.sql ./src/database/
COPY --from=builder /app/.env.example ./
COPY --from=builder /app/docker/docker-entrypoint.sh /usr/local/bin/
COPY --from=builder /app/docker/parse-config.js ./docker/
COPY --from=builder /app/docker/n8n-mcp /usr/local/bin/

# Install production dependencies
RUN npm install --production --no-audit --no-fund && \
    chmod +x /usr/local/bin/docker-entrypoint.sh /usr/local/bin/n8n-mcp

# Create HomelabARR user (consistent with other containers)
RUN addgroup -g 1000 -S homelabarr && \
    adduser -S homelabarr -u 1000 -G homelabarr && \
    chown -R homelabarr:homelabarr /app

# Environment variables
ENV IS_DOCKER=true \
    PUID=1000 \
    PGID=1000 \
    MCP_MODE=http \
    PORT=3000

# Switch to non-root user
USER homelabarr

# Expose ports
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://127.0.0.1:3000/health || exit 1

# Entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["node", "dist/mcp/index.js"]