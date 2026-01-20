FROM node:20-alpine

# Create non-root user (security requirement)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install production dependencies (correct & stable)
RUN npm ci --omit=dev

# Copy source code
COPY src ./src

# Switch to non-root user
USER appuser

# Start application
CMD ["node", "src/index.js"]
