FROM ubuntu:14.04.2
MAINTAINER vad.viktor@gmail.com

# use rbenv understandable version
#ENV RUBYVERSION jruby-1.7.4
ENV RUBYVERSION 2.1.6

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
                       # remove jdk unless building jruby
                       #openjdk-7-jre-headless \
                       zlib1g-dev \
                       && \
    apt-get clean

COPY rbenv-setup.sh /
RUN bash /rbenv-setup.sh $RUBYVERSION
RUN rm -f /rbenv-setup.sh
