FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    bind9 \
    bind9utils \
    dnsutils \
    vim

RUN mkdir -p /etc/bind/zones

COPY config/named.conf.local /etc/bind/named.conf.local

COPY zones/db.gringotts /etc/bind/zones/db.gringotts
COPY zones/db.hogwarts /etc/bind/zones/db.hogwarts
COPY zones/db.ministryofmagic /etc/bind/zones/db.ministryofmagic

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
