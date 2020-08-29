FROM node:lts-alpine as node
WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm i npm@latest -g
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.13
COPY --from=node /app/dist/angular-teste /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf