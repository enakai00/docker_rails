FROM fedora:20
MAINTAINER enakai

RUN yum install -y make gcc gcc-c++ ruby-devel \
    rubygem-rails rubygem-therubyracer rubygem-pg \
    postgresql postgresql-devel
ADD create_app.sh /usr/local/bin/create_app.sh
RUN chmod u+x /usr/local/bin/create_app.sh
CMD ["/usr/local/bin/create_app.sh"]
