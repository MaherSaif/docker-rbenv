FROM ubuntu:trusty
MAINTAINER vad.viktor@gmail.com

# use rbenv understandable version
ARG RUBY_VERSION='2.3.0'

COPY scripts/package-setup.sh /
RUN /package-setup.sh ${RUBY_VERSION}
RUN rm -f /package-setup.sh

COPY scripts/rbenv-setup.sh /
RUN bash /rbenv-setup.sh ${RUBY_VERSION}
RUN rm -f /rbenv-setup.sh
