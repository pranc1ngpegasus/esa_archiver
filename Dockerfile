FROM ruby:2.5.0
MAINTAINER Temma Fukaya <ride.or.die.2215@gmail.com>
USER root

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

RUN apt-get update
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
ENV LANG en_US.UTF-8

COPY . .

RUN gem install bundler --no-document
RUN bundle install
