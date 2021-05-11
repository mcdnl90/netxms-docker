FROM debian:stable AS base

ARG TZ="Europe/Madrid"
ENV TZ=$TZ
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update  -qq \
 && apt-get upgrade -qq -y \
 && apt-get install -qq -y --no-install-recommends \
         tzdata curl gnupg2 ca-certificates lsb-release apt-transport-https unzip git \
         netcat htop openssl jq zip strace nano less gosu gettext-base iputils-ping screen

FROM base AS install
ADD http://packages.netxms.org/netxms-release-latest.deb /tmp/netxms-release-latest.deb 
RUN apt-get install -qq -y /tmp/netxms-release-latest.deb && rm /tmp/netxms-release-latest.deb \
 && apt-get update  -qq \
 && apt-get install -qq -y --no-install-recommends \
         netxms-agent

FROM install AS install_entrypoint
COPY docker/server/entrypoint.d  /entrypoint.d
COPY docker/entrypoint.sh /usr/local/sbin/entrypoint.sh
ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]

FROM install_entrypoint AS expose_ports
EXPOSE 4700

FROM expose_ports AS netxms-agent:latest
CMD ["/usr/bin/netxms-agentd"]
