[rbenv](https://github.com/sstephenson/rbenv) enhanced image to server as base for ruby apps. Based on Ubuntu 14.04.

Sample for using it in your own image:

```
FROM rbenv-image-you-build-from-this
MAINTAINER whoami@gmail.com

RUN mkdir -p /app
COPY . /app
WORKDIR /app

RUN export PATH="/root/.rbenv/bin:$PATH" && \ # MUST
    eval "$(rbenv init -)" && \ # MUST
    bundle install && \
    gem install whatever gems you like && \
    rbenv rehash && \
    rake whatever

EXPOSE 3000

ENTRYPOINT ["/app/startup.sh"]
```

> Written with [StackEdit](https://stackedit.io/).
