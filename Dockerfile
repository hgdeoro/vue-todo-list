FROM node:12.16.3-alpine3.11 as build

RUN apk --no-cache add rsync

# Will copy generated resources to /dist
VOLUME /dist

WORKDIR /app

COPY package.json /app/

RUN yarn install

COPY ./ /app/

RUN yarn run build

ARG USER_UID
ARG USER_GID

RUN chown -R ${USER_UID}.${USER_GID} /app/dist

CMD rsync -av /app/dist/ /dist
