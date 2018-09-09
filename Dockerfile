FROM alpine:latest
LABEL maintainer=NPFLAN

RUN apk --update add bind bind-tools

RUN mkdir -p /var/named
RUN mkdir -p /run/named

ADD assets/named.conf /etc/named.conf
ADD assets/*.zone /var/named/

EXPOSE 53/udp 53/tcp

CMD /usr/sbin/named -g -c /etc/named.conf
