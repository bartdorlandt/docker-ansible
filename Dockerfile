FROM debian
MAINTAINER Bart Dorlandt

RUN apt-get -y update
RUN apt-get install -y python-yaml python-jinja2 git
RUN git clone http://github.com/ansible/ansible.git --recursive /tmp/ansible

WORKDIR /tmp/ansible
ENV PATH /tmp/ansible/bin:$PATH
ENV ANSIBLE_LIBRARY /tmp/ansible/library
#ENV ANSIBLE_CONFIG /tmp/ansible/ansible.cfg
ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH

# Using 3rd party dependencies to control LXC
RUN git submodule add https://github.com/chifflier/ansible-lxc-ssh.git connection_plugins/lxc_ssh

RUN mkdir -p /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan server >> /root/.ssh/known_hosts

WORKDIR /etc/ansible
