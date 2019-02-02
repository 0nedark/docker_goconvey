FROM drupsys/golang:1.0.0

LABEL maintainer=dovydas.rupsys@cryptohaven.com

# Add support libraries
RUN apk add --no-cache --virtual .deps git \
  && go get github.com/smartystreets/goconvey \
  && apk del .deps

WORKDIR /code
ENTRYPOINT ["goconvey", "-host", "0.0.0.0"]
