FROM          docker.io/python:3.7

ENV           ANSIBLE_VERSION=2.7.10
LABEL         maintainer="Dmitrii Mostovshchikov" \
              maintainer.email="dmadm2008@gmail.com" \
              io.k8s.description="Ansible Kit" \
              io.k8s.display-name="Ansible ${ANSIBLE_VERSION}" \
              io.openshift.tags="anible,ansible-playbook,cicd" \
              io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"
WORKDIR       /opt/app-root
RUN           pip install ansible==${ANSIBLE_VERSION} && \ 
              rm -rf /root/.cache/ && \
              useradd -m -u 1001 ansible
USER          ansible
RUN           ssh-keygen -N "" -f /home/ansible/.ssh/id_rsa && \
              cp -p $HOME/.ssh/id_rsa.pub $HOME/.ssh/authorized_keys

COPY          ./s2i/bin/ /usr/libexec/s2i
CMD           [ "/usr/libexec/s2i/usage" ]

