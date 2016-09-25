FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /job_board
WORKDIR /job_board
ADD Gemfile /job_board/Gemfile
ADD Gemfile.lock /job_board/Gemfile.lock
RUN bundle install
ADD . /job_board
