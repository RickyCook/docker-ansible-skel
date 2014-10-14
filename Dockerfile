FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
    python2.7 python2.7-dev python-pip virtualenv \
    ssh sudo

RUN useradd ansible
RUN echo ansible:ansible | chpasswd
RUN echo 'ansible ALL=NOPASSWD: ALL' > /etc/sudoers.d/ansible

RUN mkdir /tmp/ansible
RUN virtualenv /tmp/ansible/python_env
ADD ansible/requirements.txt /tmp/ansible/requirements.txt
RUN /tmp/ansible/python_env/bin/pip install -r /tmp/ansible/requirements.txt

ADD ansible /tmp/ansible/playbook
RUN /tmp/ansible/python_env/bin/ansible-playbook \
        /tmp/ansible/playbook/site.yaml \
        --connection=local \
        --inventory-file /tmp/ansible/playbook/hosts

RUN rm -rf /tmp/ansible
RUN rm /etc/sudoers.d/ansible
RUN deluser ansible

ENV SUDO_FORCE_REMOVE yes
RUN apt-get purge -y ssh sudo && apt-get -y autoremove
