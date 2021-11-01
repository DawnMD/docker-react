FROM node:16-alpine

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./

RUN npm install --silent

COPY . ./

RUN npm run build

FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html

EXPOSE 80