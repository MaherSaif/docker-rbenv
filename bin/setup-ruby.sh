#!/bin/bash

set -eu

su - parasite <<'EOF'
git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install 2.2.1
rbenv global 2.2.1
gem install bundler --no-ri --no-rdoc
rbenv rehash
EOF
