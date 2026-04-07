# ============================================================================
# STAGE 1: BUILDER - Install dependencies
# ============================================================================
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install all dependencies (including dev dependencies for building)
RUN npm ci --only=production

# Copy source code
COPY . .

# Build the application (if applicable - e.g., TypeScript, Next.js)
# Uncomment if you have a build script
# RUN npm run build

# ============================================================================
# STAGE 2: DEVELOPMENT - For local development with hot reload
# ============================================================================
FROM node:18-alpine AS development

WORKDIR /app

# Install nodemon for auto-reload during development
RUN npm install -g nodemon

# Copy package files
COPY package*.json ./

# Install all dependencies (including dev dependencies)
RUN npm ci

# Copy entire application
COPY . .

# Expose development port
EXPOSE 3000

# Run with nodemon for hot reload
CMD ["nodemon", "index.js"]

# ============================================================================
# STAGE 3: PRODUCTION - Lightweight final image
# ============================================================================
FROM node:18-alpine AS production

WORKDIR /app

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && adduser -S nodejs -u 1001

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production && npm cache clean --force

# Copy built application from builder stage
COPY --from=builder /app . 

# Copy any built artifacts (if applicable)
# COPY --from=builder /app/dist ./dist

# Change ownership to nodejs user
RUN chown -R nodejs:nodejs /app

# Switch to non-root user
USER nodejs

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

# Run application
CMD ["node", "index.js"]
