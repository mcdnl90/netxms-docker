FROM timescale/timescaledb:latest-pg13

# https://grrr.tech/posts/2020/add-locales-to-alpine-linux-docker-image/
ARG MUSL_LOCALE_DEPS="cmake make musl-dev gcc gettext-dev libintl"
ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

RUN apk add --no-cache ${MUSL_LOCALE_DEPS} \
 && wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
 && unzip musl-locales-master.zip \
 && cd musl-locales-master \
 && cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install \
 && cd .. && rm -r musl-locales-master

ARG LANG="en_US" 
ENV LANG=${LANG}.UTF-8
