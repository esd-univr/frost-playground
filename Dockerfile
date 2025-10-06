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

# Install Rust and Cargo for Lingo 
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Configure the environment PATH to include all newly installed binaries
ENV PATH="/root/.lf/bin:/root/.cargo/bin:/root/.local/bin:${PATH}"

# Clone the Lingo repository, build and install it using cargo, then clean up.
RUN git clone https://github.com/lf-lang/lingo.git /tmp/lingo && \
    cd /tmp/lingo && \
    cargo install --path . && \
    cd / && \
    rm -rf /tmp/lingo

COPY requirements.txt /tmp/requirements.txt
RUN python3 -m pip install -r /tmp/requirements.txt

COPY . /app
WORKDIR /app

# start bash shell by default
CMD ["bash"]