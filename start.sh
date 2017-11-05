#!/bin/bash

# Info:
# http://victorlin.me/posts/2014/11/13/provision-with-ansible-from-inside-docker
# docker run -it \
#  -v /vagrant/hosts:/tmp/hosts \
#  -v /vagrant/insecure_private_key:/tmp/insecure_private_key \
#  ansible-examples \
#  /sbin/my_init --skip-startup-files --skip-runit -- \
#  ansible-playbook /srv/ansible/site.yml \
#  -i /tmp/hosts -u vagrant --private-key=/tmp/insecure_private_key

docker run -it \
  -v /root/docker/ansible/etc-ansible:/etc/ansible \
  -v /root/.ssh/id_rsa:/root/.ssh/id_rsa \
  --name ansible \
  bambam82/ansible \
  /bin/bash
