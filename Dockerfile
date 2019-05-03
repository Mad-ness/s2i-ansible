FROM          docker.io/python:3.7

ENV           ANSIBLE_VERSION=2.7.10
LABEL         maintainer="Dmitrii Mostovshchikov" \
              maintainer.email="dmadm2008@gmail.com" \
              io.k8s.description="Ansible Kit" \
              io.k8s.display-name="Ansible ${ANSIBLE_VERSION}" \
              io.openshift.tags="anible,ansible-playbook,cicd" \
              io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"
RUN           pip install ansible==${ANSIBLE_VERSION} && \ 
              rm -rf /root/.cache/ && \
              useradd -u 1001 ansible
USER          1001
RUN           ssh-keygen -N "" -f /home/ansible/.ssh/id_rsa && cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys' ansible
# RUN           su -c 'ssh-keygen -N "" -f /home/ansible/.ssh/id_rsa && cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys' ansible

COPY          ./s2i/bin/ /usr/libexec/s2i
CMD           [ "/usr/libexec/s2i/usage" ]

