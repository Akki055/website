FROM ubuntu/apache2
ENTRYPOINT apachectl -D  FOREGROUND
COPY . /var/www/html
