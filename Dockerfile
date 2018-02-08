FROM alpine

ENV PATH=/usr/sbin/:$PATH
ENV PATH=/home/develop/.rbenv/bin/:$PATH

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk --update add \
    && apk add --no-cache sudo openssh py-pip build-base python-dev libffi-dev openssl-dev openrc \
    && pip install ansible \
    && apk del build-base py-pip libffi-dev openssl-dev

RUN adduser -S develop \
    && echo "develop ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers

CMD ["/usr/sbin/sshd","-D"]
