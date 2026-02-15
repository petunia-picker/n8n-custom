FROM n8nio/n8n:latest

USER root

# Install Python, pip, and ffmpeg (Debian/Ubuntu)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install yt-dlp
RUN pip3 install --break-system-packages yt-dlp

# Verify installations
RUN yt-dlp --version && ffmpeg -version

USER node

WORKDIR /home/node
