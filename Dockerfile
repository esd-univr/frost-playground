FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies, including those for compiling lingo and Python dev files
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    curl \
    git \
    openjdk-17-jdk \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    pkg-config \
    libssl-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Lingua Franca compiler (lfc)
RUN curl -Ls https://install.lf-lang.org | bash -s cli

# Install Python dependencies
COPY requirements.txt /tmp/requirements.txt
RUN python3 -m pip install -r /tmp/requirements.txt

COPY . /app
WORKDIR /app

# start bash shell by default
CMD ["bash"]