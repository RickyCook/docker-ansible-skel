Docker Ansible Skeleton
=======================

A skeleton project to setup a Docker container using an Ansible playbook.

Usage
-----

    docker build .

This will install Python/Ansible/Virtualenv/SSH and setup all the necessary
requirements for running the `ansible/site.yaml` playbook on the local Docker
container, then runs it!

After Ansible is done, all traces of it should be purged from the container so
that you're left with just the application without extra cruft. This can be
changed by editing the last few lines in the Dockerfile.
