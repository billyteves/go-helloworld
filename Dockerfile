FROM alpine:3.5

MAINTAINER Billy Ray Teves <billyteves@gmail.com> 

ADD ./bin/helloworld /usr/local/bin/helloworld

# Install Docker and dependencies 
RUN apk --update add \
  bash \
  && chmod +x /usr/local/bin/helloworld \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["helloworld"]
