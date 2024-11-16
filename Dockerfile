FROM rockylinux:8
RUN yum install -y httpd zip unzip curl && \
    mkdir -p /var/www/html
WORKDIR /var/www/html
RUN curl -SL https://www.free-css.com/assets/files/free-css-temnplates/download/page247/kindle.zip -o kindle.zip && \
    unzip kindle.zip && \
    cp -rvf markups-kindle/* . && \
    rm -rf _MACOSX markups-kindle kindle.zip
EXPOSE 80
CMD ["/usr/sbin/https", "-D", "FOREGROUND"]