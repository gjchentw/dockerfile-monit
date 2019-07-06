FROM gjchen/debian:stretch


RUN apt-get update -y && apt-get dist-upgrade -y && \
    apt-get install --no-install-recommends --no-install-suggests -y monit postfix && \
    apt-get -y autoremove && apt-get -y autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /var/spool/postfix/etc && \
    echo nameserver 8.8.8.8 > /var/spool/postfix/etc/resolv.conf && \
    cp -f /etc/services /var/spool/postfix/etc/services

COPY s6.d /etc/s6.d
