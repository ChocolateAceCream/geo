FROM ruby:3.0
WORKDIR /app
COPY . /app
RUN bundle install
CMD ["rails", "server", "-b", "0.0.0.0"]