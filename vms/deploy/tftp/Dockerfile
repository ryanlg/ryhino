FROM alpine:3.14.2

# TFTP only use UDP69 for initial handshake
# Subsequent file transfers are done through ephemeral higher ports
# `tftp-hpa` supports restricting it to a certain port range
ENV TFTP_OUTGOING_PORT_RANGE "49150:49152"

# `tftp-hpa` exposes files under this path
VOLUME /tftpboot

# http://forum.alpinelinux.org/apk/main/x86_64/tftp-hpa
RUN apk add --no-cache tftp-hpa

# Admin port is always UDP 69
EXPOSE 69/udp

RUN adduser -D tftp

CMD exec in.tftpd --foreground -vvv -u tftp --port-range $TFTP_OUTGOING_PORT_RANGE --secure /tftpboot
