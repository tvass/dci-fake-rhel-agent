FROM centos:7
RUN yum -y install centos-release epel-release \
    http://packages.distributed-ci.io/dci-release.el7.noarch.rpm && \
    yum -y install dci-rhel-agent && \
    yum clean all
COPY bkr /bin
COPY beaker-import /bin
COPY return2beaker.sh /usr/bin/return2beaker.sh
RUN mkdir /etc/beaker/
RUN touch /etc/beaker/client.conf
RUN cp /bin/true /usr/bin/setfacl
USER dci-rhel-agent
WORKDIR /usr/share/dci-rhel-agent
CMD ["/usr/bin/ansible-playbook", "-vv", "/usr/share/dci-rhel-agent/dci-rhel-agent.yml", "-e", "@/etc/dci-rhel-agent/settings.yml", "-i", "/etc/dci-rhel-agent/hosts"]