FROM blitznote/debootstrap-amd64:16.04
MAINTAINER vad.viktor@gmail.com

# use rbenv understandable version
ARG RUBY_VERSION
ENV RUBY_VERSION=${RUBY_VERSION:-2.4.0}

COPY scripts/package-setup.sh /
RUN /package-setup.sh $RUBY_VERSION
RUN rm -fv /package-setup.sh

COPY scripts/rbenv-setup.sh /
RUN bash /rbenv-setup.sh $RUBY_VERSION
RUN rm -fv /rbenv-setup.sh

COPY scripts/init.sh /init.sh
