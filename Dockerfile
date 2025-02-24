FROM node:16-alpine3.17

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

HEALTHCHECK --start-period=10s --retries=3 CMD wget --no-verbose --tries=1 --spider http://localhost:3000/db_healthcheck || exit 1

CMD [ "npm", "start" ]