FROM ruby:2.4.0
MAINTAINER Georgy Buranov <georgy.buranov@applift.com>

ARG APP_HOME=/app

# Install gems
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
# Upload source
COPY . $APP_HOME
COPY config/* $APP_HOME/config/
RUN bundle install

RUN rake db:create
RUN rake db:migrate

# Start server
CMD ["ruby", "start.rb"]
