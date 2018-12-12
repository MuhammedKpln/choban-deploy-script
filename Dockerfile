FROM nginx:alpine

RUN apk add git nodejs yarn

#RUN apt-get install git -y
RUN mkdir /var/www


RUN yarn global add docusaurus @vue/cli --unsafe-perm=true --allow-root


WORKDIR /tmp
RUN git clone https://github.com/cchoban/docs.git docs
WORKDIR /tmp/docs/
RUN yarn
WORKDIR /tmp/docs/website
RUN yarn build
RUN mv  build/cchoban /var/www/frontend


WORKDIR /tmp
ENV VUE_APP_BACKEND_SITE_URL=http://localhost/
RUN git clone https://github.com/cchoban/web-client.git -b dev client
WORKDIR /tmp/client
RUN yarn
RUN yarn build
RUN mv dist/ /var/www/packages