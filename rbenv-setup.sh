git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install 2.1.2
rbenv global 2.1.2
gem install bundler --no-ri --no-rdoc
rbenv rehash

