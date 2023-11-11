FROM ubuntu
RUN apt-get update -y && apt-get install apache2 -y
RUN apt-get install wget curl vim -y
COPY . /var/www/html
