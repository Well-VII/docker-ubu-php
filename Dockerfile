#FROM ubuntu:18.04
#ENV DEBIAN_FRONTEND noninteractive
#ADD ./index.php /app.php
#RUN apt-get update
#RUN apt install -y php
#ENTRYPOINT ["/usr/bin/php", "/app.php"]

#FROM ubuntu:18.04
#ENV DEBIAN_FRONTEND noninteractive
#ADD ./app.py /app.py
#RUN apt-get update
#RUN apt install -y python3
#ENTRYPOINT ["/usr/bin/python3", "/app.py"]

FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
 apt install -y php && \
 apt install libapache2-mod-php && \
 rm /var/www/html/index.html

ADD ./index.php /var/www/html/
ENTRYPOINT ["/usr/sbin/apachectl", "-D", "FOREGROUND"]