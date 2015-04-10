[rbenv](https://github.com/sstephenson/rbenv) enhanced image to server as base for ruby apps. Based on Ubuntu 14.04.

Sample for using it in your own image:

```
FROM vadviktor/mri:2.2.1
MAINTAINER whoami@gmail.com

COPY . /app
WORKDIR /app

RUN bundle install && \
    gem install passenger && \
    rbenv rehash && \
    rake whatever

EXPOSE 3000

ENTRYPOINT ["/app/startup.sh"]
```

> Written with [StackEdit](https://stackedit.io/).
