FROM node:20-alpine

WORKDIR /app

COPY chall/package.json .
RUN npm install --production

COPY chall/server.js .
COPY chall/public ./public

EXPOSE 4000

CMD ["node", "server.js"]
