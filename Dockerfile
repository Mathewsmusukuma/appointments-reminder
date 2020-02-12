FROM python:3.6

RUN mkdir /web
WORKDIR /web

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt


COPY . .

FROM nginx

RUN rm /etc/nginx/conf.d/default.conf
COPY mysite.conf /etc/nginx/conf.d

FROM postgres:latest

COPY ./init/01-db_setup.sh /docker-entrypoint-initdb.d/01-db-setup.sh
