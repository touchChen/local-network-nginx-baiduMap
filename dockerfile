FROM centos:7

RUN yum update -y \
    && yum install wget git gcc gcc-c++ ncurses-devel perl make libpcre3 libpcre3-dev openssl openssl-devel libssl-dev pcre-devel zlib1g zlib1g.de -y
RUN NGINX_VERSION=1.12.1 \
    && mkdir /opt/nginx \
    && cd /opt/nginx \
    && wget https://nginx.org/download/nginx-$NGINX_VERSION.tar.gz -qO- | tar xvz \
    && git clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module.git \
    && cd nginx-$NGINX_VERSION \
    && ./configure --prefix=/usr/local/nginx --with-http_ssl_module --sbin-path=/usr/local/nginx/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --add-module=/opt/nginx/ngx_http_substitutions_filter_module \
    && make \
    && make install

COPY nginx.conf /usr/local/nginx/conf/nginx.conf

EXPOSE 10086

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]


