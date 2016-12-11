#!/bin/bash

git clone --depth 1 https://github.com/sstephenson/rbenv.git /root/.rbenv && \
git clone --depth 1 https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build && \
rm -rfv /root/.rbenv/plugins/ruby-build/.git && \
rm -rfv /root/.rbenv/.git && \

# Optionally, try to compile dynamic bash extension to speed up rbenv. Don't worry if it fails; rbenv will still work normally:
cd /root/.rbenv && \
src/configure && \
make -C src && \
# ###

export PATH="/root/.rbenv/bin:$PATH" && \
export RUBY_CFLAGS='-O2' && \
export CONFIGURE_OPTS="--disable-install-doc" && \
eval "$(rbenv init -)" && \
rbenv install $1 && \
rbenv global $1 && \
gem install bundler && \
rbenv rehash
