# Stage 1 – Build
FROM node:20.19-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --cache .npm --prefer-offline

COPY . .

RUN npm run build

# Stage 2 – Runtime (NGINX 1.27)
FROM nginx:1.27-alpine

RUN rm -rf /app && mkdir /app

# Copy built Angular app to /app (as expected by nginx.conf)
COPY --from=builder /app/dist/olympic-games-starter /app

# Use the project's nginx config
COPY nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
