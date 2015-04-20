#!/bin/bash

git clone https://github.com/sstephenson/rbenv.git /root/.rbenv && \
git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build && \
echo 'PATH="/root/.rbenv/bin:$PATH"' | tee -a /root/.bashrc && \
echo 'eval "$(rbenv init -)"' | tee -a /root/.bashrc && \
export PATH="/root/.rbenv/bin:$PATH" && \
eval "$(rbenv init -)" && \
rbenv install $1 && \
rbenv global $1 && \
gem install bundler --no-ri --no-rdoc && \
rbenv rehash
