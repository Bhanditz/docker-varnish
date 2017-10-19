FROM m3hran/baseimage:latest
MAINTAINER Martin Taheri <m3hran@gmail.com>
LABEL Description="Varnish 5 Image"



# Install Packanges and Cleanup APT cache 
RUN curl -L https://packagecloud.io/varnishcache/varnish5/gpgkey | apt-key add -
RUN apt-get update

RUN clean_install.sh apt-transport-https
COPY bin/varnishcache_varnish5.list /etc/apt/sources.list.d
RUN clean_install.sh varnish
COPY bin/start_varnish.sh /etc/my_init.d/
COPY bin/varnish /etc/default/


EXPOSE 80

