FROM alpine:latest
MAINTAINER NPFLAN

RUN apk --update add bind bind-tools

RUN mkdir -p /var/named
RUN mkdir -p /run/named

ADD assets/named.conf /etc/named.conf
ADD assets/npf.zone /var/named/npf.zone

EXPOSE 5353/udp 5353/tcp

CMD /usr/sbin/named -g -c /etc/named.conf
