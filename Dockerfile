ARG           PYTHON_VERSION=3.7
FROM          docker.io/pyton:${PYTHON_VERSION}

ENV           ANSIBLE_VERSION=2.7.10
LABEL         maintainer="Dmitrii Mostovshchikov" \
              maintainer.email="dmadm2008@gmail.com"
              io.k8s.description="Ansible Kit" \
              io.k8s.display-name="Ansible ${ANSIBLE_VERSION}" \
              io.openshift.tags="anible,ansible-playbook,cicd"
              io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"
RUN           pip install ansible==${ANSIBLE_VERSION}
COPY          ./s2i/bin/ /usr/libexec/s2i
USER          1001
CMD           [ "/usr/libexec/s2i/usage" ]

