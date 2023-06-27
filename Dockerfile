
FROM centos:joyce
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG httpd_port=8080
ARG JENKINS_HOME=/var/jenkins_home
ENV MARVELLLOUS_HOME /var/marvellous/devops
RUN groupadd -g ${gid} ${group} \
    && useradd -d /home/${user} -u ${uid} -g ${gid} -m -s /bin/bash ${user}

RUN mkdir -p $JENKINS_HOME \
&& chown ${uid}:${gid} $JENKINS_HOME 5
WORKDIR /var/marvellous/devops
USER ${user}
VOLUME ${JENKINS_HOME}
CMD ["/usr/sbin/init"]
EXPOSE ${httpd_port}%  
