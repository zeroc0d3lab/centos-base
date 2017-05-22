FROM centos:7.3.1611
MAINTAINER ZeroC0D3 Team <zeroc0d3.team@gmail.com>

ENV S6OVERLAY_VERSION=v1.19.1.1 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=1 \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    TERM=xterm

RUN yum makecache fast \
    && yum provides '*/applydeltarpm' \
    && yum -y install deltarpm \
            bash-completion \
            epel-release \
            initscripts

RUN yum -y update \
    && yum -y install iproute \
            open-ssl \
            net-tools \
            gawk \
            bind-utils \
            bash ca-certificates \
            curl \
            wget \
            tar \
            ansible \
            openssh-clients \
            openssh-server \
            python-pip \
            sudo \
            which \
    && curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xz -C / \
    && yum clean all

RUN ["ln", "-s", "/usr/bin/bash", "/bin/bash"]
RUN ["ln", "-s", "/usr/bin/sh", "/bin/sh"]

COPY rootfs/ /

EXPOSE 22

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]
