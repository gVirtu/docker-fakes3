FROM alpine:3.6
MAINTAINER Giancarlo De Roberto <giandroberto@gmail.com>
ENV FAKES3_VERSION=1.2.1
WORKDIR /fakes3_data
EXPOSE 10001
CMD ["fakes3", "server", "--root",  ".", "--port",  "10001"]

# Build-time metadata as defined at http://label-schema.org
    ARG BUILD_DATE
    ARG VCS_REF
    ARG VERSION
    LABEL org.label-schema.build-date=$BUILD_DATE \
          org.label-schema.name="fakes3" \
          org.label-schema.description="A lightweight server clone of Amazon S3 that simulates most of the commands supported by S3 with minimal dependencies" \
          org.label-schema.url="https://github.com/jubos/fake-s3" \
          org.label-schema.vcs-ref=$VCS_REF \
          org.label-schema.vcs-url="https://github.com/gVirtu/docker-fakes3" \
          org.label-schema.vendor="jubos" \
          org.label-schema.version="1.2.1" \
          org.label-schema.schema-version="1.0"

RUN apk add --no-cache ruby ruby-io-console
RUN gem install fakes3 -v $FAKES3_VERSION --no-doc

# to run with a non-root user, we need to manually create the workdir with the needed ownership
# and declare the VOLUME after the USER
RUN mkdir -p /fakes3_data && chown nobody:nobody /fakes3_data && chmod 0750 /fakes3_data
USER nobody
VOLUME /fakes3_data
