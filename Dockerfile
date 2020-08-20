FROM node
ENV http_proxy http://172.20.22.26:80 
RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /app

COPY package.json /app/
RUN npm config set http-proxy http://172.20.22.26:80
RUN npm config set https-proxy http://172.20.22.26:80
RUN npm install --only=production

COPY src /app/src

EXPOSE 3000

CMD [ "npm", "start" ]

