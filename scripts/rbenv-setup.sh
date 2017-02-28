#!/bin/bash

git clone --depth 1 https://github.com/rbenv/rbenv.git /root/.rbenv && \
git clone --depth 1 https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build && \
rm -rfv /root/.rbenv/plugins/ruby-build/.git && \
rm -rfv /root/.rbenv/.git && \
export PATH="/root/.rbenv/bin:$PATH" && \
export RUBY_CFLAGS='-O2' && \
export CONFIGURE_OPTS="--disable-install-doc" && \
eval "$(rbenv init -)" && \
rbenv install $1 && \
rbenv global $1 && \
gem install bundler && \
rbenv rehash

