FROM ubuntu:14.04.2
MAINTAINER vad.viktor@gmail.com

#
# BUMP RUBY VERSION IN rbenv-setup.sh
#

# add packages as required
RUN apt-get update && \
    apt-get install -y autoconf \
                       bison \
                       build-essential \
                       curl \
                       git \
                       libffi-dev \
                       libgdbm-dev \
                       libgdbm3 \
                       libncurses5-dev \
                       libreadline6-dev \
                       libssl-dev \
                       libyaml-dev \
                       #openjdk-7-jre-headless \
                       zlib1g-dev \
                       && \
    apt-get clean

COPY rbenv-setup.sh /
RUN sh /rbenv-setup.sh
RUN rm -f /rbenv-setup.sh
