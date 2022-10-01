FROM alpine:latest

RUN apk add --no-cache supervisor wget

COPY crontab.txt /crontab.txt
RUN crontab /crontab.txt
RUN chmod 600 /etc/crontab

COPY supervisord.conf /etc/supervisord.conf

COPY dnscrypt-proxy.toml /etc/dnscrypt-proxy.toml
COPY dnscrypt-proxy-forwarding-rules.txt /

CMD ["/usr/local/bin/supervisord"]
