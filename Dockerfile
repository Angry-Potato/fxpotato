FROM ruby:2.4.1-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git libxml2-dev libxslt-dev build-base

COPY . /usr/src/app/

WORKDIR /usr/src/app

RUN bundle install

CMD rake test
