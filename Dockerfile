# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory to root
WORKDIR /

# Install git, bash, and other useful tools
RUN apt-get update && apt-get install -y \
    git \
    bash \
    tree \
    && rm -rf /var/lib/apt/lists/*

# Set bash as the default shell
SHELL ["/bin/bash", "-c"]

# Optional: Configure git with default user
RUN git config --global user.name "rishav" && \
    git config --global user.email "rishav.chatt@gmail.com"

RUN git config --global url."git@github.com:".insteadOf "https://github.com/"

# Configure Git to use credential helper
RUN git config --global credential.helper store

# Copy SSH key and config (ensure these files exist in your build context)
COPY id_rsa /root/.ssh/id_rsa
COPY config /root/.ssh/config

# Set correct permissions
RUN chmod 600 /root/.ssh/id_rsa \
    && chmod 600 /root/.ssh/config

# Add GitHub to known hosts
RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

# Default command to start an interactive bash shell
CMD ["/bin/bash"]