#### Stage 1: Build the React application
FROM node:12.22.12-alpine as build

WORKDIR /app

COPY package.json ./
RUN rm -f package-lock.json

# Correct old AntD + CRA versions
RUN npm install react-app-rewired@2.1.8 customize-cra@0.9.1 less-loader@5 less@3.13.1 --legacy-peer-deps

# Project deps
RUN npm install --legacy-peer-deps

COPY . ./

ARG REACT_APP_API_BASE_URL
ENV REACT_APP_API_BASE_URL=${REACT_APP_API_BASE_URL}

RUN npm run build

#### Stage 2: Serve with Nginx
FROM nginx:1.25-alpine

COPY --from=build /app/build /var/www
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
