# Use a lightweight base image
FROM alpine:latest

# Install required packages
RUN apk add --no-cache git nodejs npm

# Clone the Super-Linter repository
RUN git clone https://github.com/github/super-linter.git /super-linter

# Build Super-Linter
WORKDIR /super-linter
RUN npm install
RUN npm run build

# Copy the built files into a smaller base image
FROM node:alpine
COPY --from=0 /super-linter /super-linter

# Set the entrypoint
ENTRYPOINT ["/super-linter/entrypoint.sh"]
