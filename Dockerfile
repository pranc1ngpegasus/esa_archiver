FROM ruby:3-slim
MAINTAINER Temma Fukaya <ride.or.die.2215@gmail.com>
USER root
WORKDIR /app
COPY . .

RUN apt-get update
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
ENV LANG en_US.UTF-8

RUN gem install bundler:2.0.2
RUN bundle install
