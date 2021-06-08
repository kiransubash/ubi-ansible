FROM registry.access.redhat.com/ubi8/ubi:latest
LABEL maintainer="Kiran Subash"
ENV PYTHON_PACKAGES="ansible"

RUN echo "enabled=0" >> /etc/yum/pluginconf.d/subscription-manager.conf

RUN dnf -y update \
  && dnf install -y python3.8 \
  && dnf clean all \
  && pip3 install --upgrade pip \
  && pip3 install ${PYTHON_PACKAGES} \
  && mkdir -p /etc/ansible \
  && echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts


