FROM ruby:2.4.0
MAINTAINER Georgy Buranov <georgy.buranov@applift.com>

# Install gems
ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Upload source
COPY . $APP_HOME

RUN rake db:create
RUN rake db:migrate

# Start server
CMD ["ruby", "start.rb"]
