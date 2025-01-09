FROM ubuntu:latest

# Install system dependencies
RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
        curl \
        tar \
        gzip \
        wget \
        jq \ # Useful for JSON processing if needed
    && rm -rf /var/lib/apt/lists/*

# Install Helm
ARG HELM_VERSION=v3.12.0
RUN wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xzf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/ \
    && rm helm-${HELM_VERSION}-linux-amd64.tar.gz

# Install Kyverno (Specific Version)
RUN curl -LO https://github.com/kyverno/kyverno/releases/download/v1.12.0/kyverno-cli_v1.12.0_linux_x86_64.tar.gz \
    && tar -xvf kyverno-cli_v1.12.0_linux_x86_64.tar.gz \
    && mv kyverno /usr/local/bin/ \
    && rm kyverno-cli_v1.12.0_linux_x86_64.tar.gz

# Set working directory (optional)
WORKDIR /app

# Copy any necessary files (e.g., Kyverno policies)
# COPY policies/ /app/policies/

# Set entrypoint (optional)
# ENTRYPOINT ["/bin/bash"]