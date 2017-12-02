FROM ruby:2.4.0
MAINTAINER Georgy Buranov <gburanov@gmail.com>

ARG APP_HOME=/app

# Install gems
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
# Upload source
COPY . $APP_HOME
COPY config/* $APP_HOME/config/
RUN bundle install

# Start server
CMD ["./start_script.sh"]
