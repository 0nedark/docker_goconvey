FROM drupsys/golang:1.0.0

LABEL maintainer=dovydas.rupsys@cryptohaven.com

# Add support libraries
RUN apk add --no-cache --virtual .deps git \
  && go get github.com/smartystreets/goconvey \
  && apk del .deps \
  && apk add --no-cache gcc musl-dev

WORKDIR /code
ENTRYPOINT ["goconvey", "-host", "0.0.0.0"]
