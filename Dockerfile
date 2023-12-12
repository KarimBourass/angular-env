FROM node:16.13-alpine AS build

ARG NG_ENV
ENV NG_ENV=$NG_ENV

ARG ENV=production
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install --legacy-peer-deps
COPY . .
RUN npm run build -- --configuration=$ENV

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/angular-env /usr/share/nginx/html