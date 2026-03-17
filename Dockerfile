FROM node:20-slim AS build

WORKDIR /app

COPY package.json package-lock.json* ./

RUN npm install --production

COPY . .

FROM node:20-slim

WORKDIR /app

COPY --from=build /app /app

EXPOSE 3000

CMD ["npm", "start"]