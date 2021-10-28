FROM centos:7

MAINTAINER dm <@gmail.com>

RUN yum -y install deltarpm

RUN yum -y install epel-release

RUN yum -y update

RUN yum -y install httpd

# Fix timezone issue
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#COPY ./vhost.conf /etc/httpd/conf.d/

RUN systemctl enable httpd

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
