FROM n8nio/n8n:latest

USER root

# Install Python, pip, and ffmpeg (required for yt-dlp)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg

# Install yt-dlp
RUN pip3 install --break-system-packages yt-dlp

# Verify installations
RUN yt-dlp --version && ffmpeg -version

USER node

WORKDIR /home/node
