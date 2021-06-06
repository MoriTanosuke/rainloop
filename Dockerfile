FROM alpine:3 as build

RUN apk update && apk add curl \
  && curl -o rainloop.zip -L https://github.com/RainLoop/rainloop-webmail/releases/download/v1.16.0/rainloop-community-1.16.0.zip \
  && mkdir /rainloop && unzip -q rainloop.zip -d /rainloop

FROM php:8-apache

COPY --from=build /rainloop .
VOLUME /var/www/html/data
