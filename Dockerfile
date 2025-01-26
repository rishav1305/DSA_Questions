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

# Default command to start an interactive bash shell
CMD ["/bin/bash"]