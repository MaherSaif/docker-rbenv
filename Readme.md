Ubuntu LTS Xenial (16.04) based image with [rbenv](https://github.com/rbenv/rbenv) and it's [ruby-build](https://github.com/rbenv/ruby-build) plugin.

# Build exaples

## To build an MRI:

`docker build --no-cache --build-arg RUBY_VERSION=2.4.0 --force-rm --tag=some-name/mri:0.0.1 .`

## To build a jRuby:

`docker build --no-cache --build-arg RUBY_VERSION=jruby-9.1.7.0 --force-rm --tag=some-name/jruby:0.0.1 .`

# Usage example as an app

```
FROM vadviktor/mri:2.4.0
MAINTAINER whoami@gmail.com

RUN mkdir -p /app
COPY . /app
WORKDIR /app

RUN . /init.sh && \
    bundle install && \
    gem install whatever gems you like && \
    rbenv rehash && \
    rake whatever

EXPOSE 3000

ENTRYPOINT ["/app/startup.sh"]
```

`startup.sh` example:

Setting the PATH and initializing rbenv is mandatory. Running code with [`exec`](http://wiki.bash-hackers.org/commands/builtin/exec) is a must have.

```
#!/bin/bash

export PATH="/root/.rbenv/bin:$PATH" && \
eval "$(rbenv init -)" && \
exec bundle exec thin -e production -p 3000 start
```

# Usage example for running single scripts

In this example we are running a minitest suite.

All the tests:

`docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vadviktor/mri:2.4.0 bash /init.sh && for file in test/test_*.rb; do ruby -Ilib:test $file; done`

One-by-one:

`docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vadviktor/mri:2.4.0 bash /init.sh && ruby -Ilib:test test/test_my_class.rb`
