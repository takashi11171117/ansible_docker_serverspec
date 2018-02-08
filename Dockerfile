FROM alpine

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk --update add \
    && apk add --no-cache ruby ruby-io-console ruby-json py-pip build-base python-dev libffi-dev openssl-dev openrc \
    && pip install ansible \
    && gem install itamae rake serverspec --no-ri --no-rdoc \
    && apk del build-base py-pip libffi-dev openssl-dev

CMD ["tail", "-f", "/dev/null"]
