FROM ruby:2.6.3-stretch
MAINTAINER Temma Fukaya <ride.or.die.2215@gmail.com>
USER root
WORKDIR /app
COPY . .

RUN apt-get update
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
ENV LANG en_US.UTF-8

RUN bundle install
