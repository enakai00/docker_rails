FROM centos:centos6
MAINTAINER enakai

RUN yum -y install postgresql-server
ADD init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh
CMD ["/usr/local/bin/init.sh"]
