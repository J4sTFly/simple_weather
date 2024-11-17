ARG RUBY_VERSION=3.3.5
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev postgresql-client

WORKDIR /rails

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /rails

ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}

ENTRYPOINT [ "bin/docker-entrypoint" ]

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
