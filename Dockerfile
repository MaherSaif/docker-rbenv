FROM ubuntu:trusty
MAINTAINER vad.viktor@gmail.com

#
# BUMP RUBY VERSION IN bin/setup-ruby.sh
#

# add packages as required
RUN apt-get update && \
    apt-get install -y sudo \
                       autoconf \
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
                       # openjdk-7-jdk \
                       zlib1g-dev \
                       && \
    apt-get clean

ADD bin/setup-ruby.sh /usr/sbin/
ADD bin/setup-sudo.sh /usr/sbin/

RUN chmod 755 /usr/sbin/setup-ruby.sh && \
    chmod 755 /usr/sbin/setup-sudo.sh

RUN useradd -m -d /home/parasite -p parasite parasite && \
    adduser parasite sudo && \
    chsh -s /bin/bash parasite

RUN setup-sudo.sh
RUN setup-ruby.sh

USER parasite
ENV HOME /home/parasite
ENV PATH /home/parasite/.rbenv/shims:/home/parasite/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN sudo mkdir /app && sudo chown parasite:parasite /app # placeholder for application code