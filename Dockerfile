FROM ruby:2.4.1-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git libxml2-dev libxslt-dev build-base

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
COPY fxpotato.gemspec /usr/src/app/
COPY .git /usr/src/app/.git
COPY lib/fxpotato/version.rb /usr/src/app/lib/fxpotato/

WORKDIR /usr/src/app

RUN bundle install

COPY . /usr/src/app/
RUN rake install

CMD rake test
