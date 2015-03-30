FROM itoed/node
MAINTAINER Eduardo Ito <itoed@yahoo.com>

RUN yum install -y openssh-server python-pip inotify-tools; yum clean all
RUN pip install supervisor
RUN npm install -g pm2

RUN useradd developer
ADD developer_id_rsa.pub /home/developer/.ssh/authorized_keys
ADD app /home/developer/app/
RUN chown -R developer:developer /home/developer ; \
    chmod go-rwx /home/developer/.ssh/authorized_keys

ADD start.sh /usr/local/bin/
ADD watch.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ADD supervisord.conf /etc/

EXPOSE 22 3000

CMD  [ "start.sh" ]
