FROM ruby:2.3.1

WORKDIR /opt/apps/transaction-bug/
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
