FROM node:16.15.0-alpine

RUN apk update && apk add --no-cache git curl && curl -o- -L https://yarnpkg.com/install.sh | sh

RUN mkdir -p /front
WORKDIR /front

COPY package*.json ./
RUN yarn install
COPY . .

CMD ["yarn", "run", "serve"]