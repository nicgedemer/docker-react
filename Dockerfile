FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

### /app/build <--- all the items we care about to serve for prod

FROM nginx 

COPY --from=builder /app/build /usr/share/nginx/html
