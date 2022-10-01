FROM alpine:latest

RUN apk add --no-cache supervisor wget dnscrypt-proxy

COPY crontab.txt /crontab.txt
RUN chmod 755 /crontab.txt
RUN crontab /crontab.txt

COPY supervisord.ini /etc/supervisord.ini

COPY dnscrypt-proxy.toml /etc/dnscrypt-proxy.toml
COPY dnscrypt-proxy-forwarding-rules.txt /

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
