FROM nginx:alpine

RUN apk add git nodejs yarn

#RUN apt-get install git -y
RUN mkdir /var/www

RUN yarn global add @vue/cli --unsafe-perm=true --allow-root

WORKDIR /tmp
ENV VUE_APP_BACKEND_SITE_URL=https://choban.app/
RUN git clone https://github.com/cchoban/web-client.git -b dev client
WORKDIR /tmp/client
RUN yarn
RUN yarn build
RUN mv dist/ /var/www/packages