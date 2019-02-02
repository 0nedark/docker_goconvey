FROM drupsys/golang:1.0.0

LABEL maintainer=dovydas.rupsys@cryptohaven.com

# Add support libraries
RUN apk --update add nginx --no-cache \
  && apk add --no-cache --virtual .deps git \
  && go get github.com/smartystreets/goconvey \
  && apk del .deps \
  && rm -fr /go/src

COPY site.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "pid /tmp/nginx.pid;daemon off;"]
