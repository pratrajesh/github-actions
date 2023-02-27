FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y git nodejs npm

RUN git clone https://github.com/github/super-linter.git /usr/share/super-linter
RUN chmod +x /usr/share/super-linter/install.sh
RUN /usr/share/super-linter/install.sh

ENTRYPOINT ["super-linter"]
