FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/github/super-linter.git /super-linter
WORKDIR /super-linter
RUN ./install.sh
