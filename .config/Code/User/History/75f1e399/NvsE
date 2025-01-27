FROM node:21.7.3-alpine

WORKDIR /app

COPY package.*json /app

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]