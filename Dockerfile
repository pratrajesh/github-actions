FROM github/super-linter:latest

# Set up caching directory
RUN mkdir -p /tmp/cache
RUN chmod -R 777 /tmp/cache

# Set up GitHub token
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN=$GITHUB_TOKEN

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
