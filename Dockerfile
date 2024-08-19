FROM ruby:3.1-slim as base

RUN apt-get update -qq \
  && apt-get install -yq --no-install-recommends git build-essential less

WORKDIR /app

ARG BUNDLER_VERSION=2.3.27
RUN gem install bundler -v $BUNDLER_VERSION

COPY Gemfile Gemfile.lock .

RUN bundle install
EXPOSE 4001
