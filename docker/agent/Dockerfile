FROM debian:stable AS base

ARG TZ=Europe/Madrid \
    LOCALE=en_US
ENV TZ=$TZ \
    LOCALE=$LOCALE \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update  -qq \
 && apt-get upgrade -qq -y \
 && apt-get install -qq -y --no-install-recommends \
         tzdata curl gnupg2 ca-certificates lsb-release apt-transport-https unzip git \
         netcat htop openssl jq zip strace nano less gosu gettext-base iputils-ping locales \
 && locale-gen --no-purge $LOCALE.UTF-8 \
 && localedef -i $LOCALE -c -f UTF-8 -A /usr/share/locale/locale.alias $LOCALE.UTF-8 

ENV LANG=$LOCALE.UTF-8 \
    LC_ALL=$LOCALE.UTF-8

FROM base AS install
ADD http://packages.netxms.org/netxms-release-latest.deb /tmp/netxms-release-latest.deb 
RUN apt-get install -qq -y /tmp/netxms-release-latest.deb && rm /tmp/netxms-release-latest.deb \
 && apt-get update  -qq \
 && apt-get install -qq -y --no-install-recommends \
         netxms-agent \
 && apt-get autoremove -qq -y --purge \
 && apt-get clean -qq -y \
 && rm -rf /var/lib/apt/lists

FROM install AS install_entrypoint
RUN mkdir -vp /entrypoint.d
COPY docker/entrypoint.sh /usr/local/sbin/entrypoint.sh
ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]

FROM install_entrypoint AS expose_ports
EXPOSE 4700

FROM expose_ports AS netxms-agent
CMD ["/usr/bin/netxms-agentd"]
