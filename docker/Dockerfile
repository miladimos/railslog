FROM ruby:alpine

LABEL maintainer="miladimos"

WORKDIR /app

COPY ../ .

RUN apt-get update \
    apt-get upgrade 

CMD ["rails", "server"]

EXPOSE 3000