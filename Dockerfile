FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /cookbook
WORKDIR /cookbook
COPY Gemfile /cookbook/Gemfile
COPY Gemfile.lock /cookbook/Gemfile.lock
RUN bundle install
COPY . /cookbook

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-e", "production", "-b", "0.0.0.0"]
