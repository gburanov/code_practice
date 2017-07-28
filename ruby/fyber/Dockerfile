FROM ruby:2.3.0-onbuild

RUN apt-get update

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without production test

# Copy the main application.
COPY . ./

CMD ["ruby", "server.rb"]
