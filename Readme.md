mri | jruby
--- | ---
[![](https://images.microbadger.com/badges/version/vadviktor/mri.svg)](https://microbadger.com/images/vadviktor/mri "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/version/vadviktor/jruby.svg)](https://microbadger.com/images/vadviktor/jruby "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/vadviktor/mri.svg)](https://microbadger.com/images/vadviktor/mri "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/vadviktor/jruby.svg)](https://microbadger.com/images/vadviktor/jruby "Get your own image badge on microbadger.com")

Ubuntu LTS Xenial (16.04) based image with [rbenv](https://github.com/sstephenson/rbenv) and it's [ruby-build](https://github.com/rbenv/ruby-build) plugin.

# Build exaples

## To build an MRI:

`docker build --build-arg RUBY_VERSION=2.3.3 --rm --tag=some-name/mri:0.0.1 .`

## To build a jRuby:

`docker build --build-arg RUBY_VERSION=jruby-9.1.6.0 --rm --tag=some-name/jruby:0.0.1 .`

# Usage example as an app

```
FROM vadviktor/mri:2.3.3
MAINTAINER whoami@gmail.com

RUN mkdir -p /app
COPY . /app
WORKDIR /app

RUN . /init.sh && \ #MUST
    bundle install && \
    gem install whatever gems you like && \
    rbenv rehash && \
    rake whatever

EXPOSE 3000

ENTRYPOINT ["/app/startup.sh"]
```

`startup.sh` example:

```
#!/usr/bin/env bash

export PATH="/root/.rbenv/bin:$PATH" && \
eval "$(rbenv init -)" && \
exec bundle exec thin -e production -p 3000 start
```

# Usage example as a single script

In this example we are running a minitest suite.

`docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vadviktor/mri:2.3.3 sh /init.sh && ruby -Ilib:test test/test_my_cool_app.rb`
