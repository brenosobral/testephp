FROM centos:centos7
MAINTAINER Steve Pousty <thesteve0@redhat.com>
RUN yum install -y --setopt=tsflags=nodocs httpd.x86_64 && yum clean all -y
COPY conf/httpd.conf /etc/httpd/conf/httpd.conf
EXPOSE 8080
RUN rm -rf /run/httpd && mkdir /run/httpd && chmod -R a+rwx /run/httpd
USER 1001
CMD /usr/sbin/apachectl -DFOREGROUND
