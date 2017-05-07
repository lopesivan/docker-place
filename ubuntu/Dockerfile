# ubuntu
# Docker version 17.03.0-ce, build 60ccb22

FROM ubuntu:14.04
MAINTAINER Ivan Lopes <ivan@42algoritmos.com.br>
# avoid debconf and initrd

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN dpkg-divert --local --rename --add /sbin/initctl \
    && ln -sf /bin/true /sbin/initctl

# Setting location areas

# export TIMEZONE="America/Sao_Paulo"
ENV TIMEZONE America/Sao_Paulo
RUN locale-gen en_US en_US.UTF-8

# Installing a minimal configuration to work with ubuntu

RUN set -x \
    && buildDeps='lsb-release openssh-server sudo curl wget git supervisor ca-certificates' \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && mkdir /var/run/sshd \
    && mkdir -p /var/log/supervisor \
    && echo "$TIMEZONE" > /etc/timezone  \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Accept certificates signed by our own CA
ADD ca.crt /usr/local/share/ca-certificates/ca.crt
RUN update-ca-certificates

# SSH login fix. Otherwise user is kicked off after login

RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN mkdir -p /root/.ssh/
ADD id_rsa_root.pub /root/.ssh/authorized_keys

# copy supervisor conf
ADD src/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# cd /workspace
#WORKDIR workspace

#ENTRYPOINT ["bash", "root/workspace/hw.sh"]
#CMD ["--help"]
# if test $# -eq 0; then
#     bash script.sh "$@"
# else
#     bash script.sh --help
# fi
