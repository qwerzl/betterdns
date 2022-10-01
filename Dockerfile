FROM alpine:latest

RUN apk add --no-cache python3 python3-dev py3-pip wget dnscrypt-proxy

RUN pip install supervisor-stdout supervisor
COPY crontab.txt /crontab.txt
RUN chmod 755 /crontab.txt
RUN crontab /crontab.txt

COPY supervisord.ini /etc/supervisord.ini

COPY dnscrypt-proxy.toml /etc/dnscrypt-proxy.toml
COPY dnscrypt-proxy-forwarding-rules.txt /

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
