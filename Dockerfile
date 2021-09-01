FROM alpine:3.14

ENV IP		0.0.0.0
ENV PORT		1688
ENV EPID		""
ENV LCID		1033
ENV CLIENT_COUNT	26
ENV ACTIVATION_INTERVAL	120
ENV RENEWAL_INTERVAL	10080
ENV HWID		"RANDOM"
ENV LOGLEVEL	INFO
ENV LOGFILE		/var/log/pykms_logserver.log
ENV LOGSIZE		""

RUN \
  apk add --update --no-cache --virtual=build-dependencies \
    git \
    gcc \
    musl-dev \
    py3-wheel \
    python3-dev && \
  apk add --no-cache --update \
    bash \
    py3-argparse \
    py3-flask \
    py3-pygments \
    python3-tkinter \
    sqlite-libs \
    py3-pip && \
  pip3 install peewee tzlocal && \
  git clone https://github.com/SystemRage/py-kms/ /tmp/py-kms && \
  mv /tmp/py-kms/py-kms /home/ && \
  apk del --purge \
    build-dependencies && \
  rm -rf \
    /tmp/*

COPY /pykms_Base.py /home/py-kms

WORKDIR /home/py-kms

EXPOSE ${PORT}/tcp

ENTRYPOINT /usr/bin/python3 pykms_Server.py ${IP} ${PORT} -l ${LCID} -c ${CLIENT_COUNT} -a ${ACTIVATION_INTERVAL} -r ${RENEWAL_INTERVAL} -w ${HWID} -V ${LOGLEVEL} -F ${LOGFILE}
