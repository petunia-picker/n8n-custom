FROM n8nio/n8n:latest

USER root

# Update package index first
RUN apk update && \
    apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg

# Install yt-dlp
RUN pip3 install --break-system-packages yt-dlp

# Verify installations
RUN yt-dlp --version && ffmpeg -version

USER node

WORKDIR /home/node
