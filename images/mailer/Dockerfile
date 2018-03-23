FROM alpine:edge
MAINTAINER Bojan Cekrlic - https://github.com/bokysan/docker-postfix/

# See README.md for details

RUN	true && \
	apk add --no-cache --update postfix ca-certificates supervisor rsyslog bash && \
    apk add --no-cache --upgrade musl musl-utils && \
	(rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)

COPY	supervisord.conf /etc/supervisord.conf
COPY	rsyslog.conf /etc/rsyslog.conf
COPY	run.sh /run.sh
RUN	chmod +x /run.sh

VOLUME	[ "/var/spool/postfix", "/etc/postfix" ]

USER	root
WORKDIR	/tmp

EXPOSE 587
#ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
ENTRYPOINT ["/run.sh"]
