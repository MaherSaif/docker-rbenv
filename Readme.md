Ubuntu LTS Trusty (14.04) based image with [rbenv](https://github.com/sstephenson/rbenv) and it's [ruby-build](https://github.com/rbenv/ruby-build) plugin.

Build exaples
---

To build an MRI:

`docker build --build-arg RUBY_VERSION=2.3.0 --rm --tag=some-name/mri:0.0.1 .`

To build a jRuby:

`docker build --build-arg RUBY_VERSION=jruby-1.7.18 --rm --tag=some-name/jruby:0.0.1 .`

Usage example
---

```
FROM vadviktor/mri:2.3.0
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
