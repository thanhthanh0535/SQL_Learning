FROM mcr.microsoft.com/devcontainers/base:ubuntu

COPY my.cnf /etc
RUN chmod 644 /etc/my.cnf

RUN apt-get update -y && \
    apt-get install -y mariadb-client libmariadb-dev && \
    apt-get install -y python3 python3-pip python-is-python3
    