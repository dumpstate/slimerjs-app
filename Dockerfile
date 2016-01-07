FROM ubuntu:trusty

RUN DEBIAN_FRONTEND=noninteractive && \
  apt-get -y update && \
  apt-get install -y libc6 libstdc++6 libdbus-glib-1-2 libgcc1 libgtk2.0-0 libasound2 libxrender1 cups xvfb
RUN apt-get install -y curl git wget zip

RUN mkdir /opt/nodejs && \
  curl https://nodejs.org/dist/v5.3.0/node-v5.3.0-linux-x64.tar.gz | tar xvzf - -C /opt/nodejs --strip-components=1
ENV PATH $PATH:/opt/nodejs/bin

RUN npm install -g -y pm2

CMD mkdir -p /opt/app
VOLUME /opt/app

EXPOSE 8080
