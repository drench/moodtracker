FROM ruby:2.5.1

EXPOSE 3000

RUN apt-get update && apt-get upgrade -y && apt-get install -y nodejs postgresql-client
RUN gem install bundler --no-ri --no-document

RUN mkdir /code
WORKDIR /code

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5

COPY . ./

CMD ["rails", "server"]
