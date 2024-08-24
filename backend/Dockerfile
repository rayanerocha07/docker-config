FROM ruby:3.1.3-bullseye

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN gem install bundler rails rake

RUN mkdir /app
WORKDIR /app

ENV RAILS_ENV=development
ENV RAILS_ROOT /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
