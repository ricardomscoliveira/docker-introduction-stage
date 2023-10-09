FROM node:6-alpine

EXPOSE 3000

RUN apk add --update tini

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN npm install && npm cache clean

COPY . .

CMD [ "tini", "--", "node", "./bin/www" ]