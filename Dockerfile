FROM alpine:latest AS builder

ARG THTTPD_VERSION=2.29

RUN apk --update --no-cache add gcc musl-dev make \
  && wget http://www.acme.com/software/thttpd/thttpd-${THTTPD_VERSION}.tar.gz \
  && tar xzf thttpd-${THTTPD_VERSION}.tar.gz \
  && mv /thttpd-${THTTPD_VERSION} /thttpd \
  && cd /thttpd \
  && ./configure \
  && make CCOPT='-O2 -s -static' thttpd \
  && chown 0:0 /thttpd/thttpd \
  && chmod 755 /thttpd/thttpd

###############################################################################

FROM scratch

ENV TZ        UTC

COPY --from=builder /etc/passwd /etc/passwd

COPY --from=builder /thttpd/thttpd /usr/sbin/thttpd

VOLUME [ "/www" ]

EXPOSE 3000

CMD [ "/usr/sbin/thttpd", "-D", "-h", "0.0.0.0", "-p", "3000", "-d", "/www", "-l", "-", "-M", "60" ]
