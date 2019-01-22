FROM nginx

#RUN apk add git nodejs yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN apt-get install git nodejs -y
RUN mkdir /var/www

RUN npm install -g @vue/cli

WORKDIR /tmp
ENV VUE_APP_BACKEND_SITE_URL=https://choban.app/
RUN git clone https://github.com/cchoban/web-client.git -b dev client
WORKDIR /tmp/client
RUN npm install
RUN npm run build
RUN mv dist/ /var/www/packages
