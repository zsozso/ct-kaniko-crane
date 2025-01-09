FROM gcr.io/kaniko-project/executor:v1.23.2-debug
RUN mkdir -p /usr/local/bin \
    && wget -qO - https://github.com/google/go-containerregistry/releases/download/v0.20.2/go-containerregistry_Linux_x86_64.tar.gz \
        |tar -xzf - crane krane gcrane -C /usr/local/bin
