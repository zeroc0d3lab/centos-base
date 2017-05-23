FROM centos:7.3.1611
MAINTAINER ZeroC0D3 Team <zeroc0d3.team@gmail.com>

## SET ENVIRONMENT ##
ENV S6OVERLAY_VERSION=v1.19.1.1 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=1 \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    TERM=xterm

## FIND FASTEST REPO & UPDATE REPO ##
RUN yum makecache fast \
    && yum provides '*/applydeltarpm' 

## INSTALL BASE DEPENDENCY ##
RUN yum -y update \
    && yum -y install deltarpm \
            bash-completion \
            epel-release \
            initscripts
            iproute \
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

## CLEAN UP ALL CACHE ##
RUN yum clean all

## SYMLINK bash & sh (inside container) ##
RUN ["ln", "-s", "/usr/bin/bash", "/bin/bash"]
RUN ["ln", "-s", "/usr/bin/sh", "/bin/sh"]

## FINALIZE (reconfigure) ##
COPY rootfs/ /

## SET PORT ##
EXPOSE 22

## SET VOLUME ##
VOLUME ["/sys/fs/cgroup"]

## RUN INIT ##
CMD ["/usr/sbin/init"]

