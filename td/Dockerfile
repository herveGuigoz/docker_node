FROM node:11.5-alpine

RUN apk update && apk upgrade

# Create app directory.
RUN mkdir -p /td
WORKDIR /td

# Prevent the reinstallation of node modules at every changes in the source code.
COPY package.json yarn.lock ./
RUN apk add python make g++
RUN yarn install --force

COPY . ./


ENV HOST 0.0.0.0
ENV PORT=3000

CMD yarn dev