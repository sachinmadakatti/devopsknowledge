FROM centos:latest
MAINTAINER sachinsmadakatti011@gmail.com
RUN yum install -y httpd \
  zip \
  unzip
ADD https://www.free-css.com/assets/files/free-css-temnplates/download/page247/kindle.zip /var/www/html
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
RUN rm -rf _MACOSX markups-kindle kindle.zip
CMD ["/usr/sbin/https", "-D", "FOREGROUND"]
EXPOSE 80
