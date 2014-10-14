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

Updating the Ansible playbook should be a quick and painless process with the
Docker caches. We install Ansible and its dependencies in a virtualenv, before
adding the actual playbook, so most of the build process is cached. The only
thing that can't really be is the playbook run itself, which will always be
run from scratch every time. You may want to change with by applying tags on
different Docker layers. If this is the case, you can copy the lines (it's a multi-line command for cleanliness)
that start:

    RUN /tmp/ansible/python_env/bin/ansible-playbook \

and at the end, add

    --inventory-file /tmp/ansible/playbook/hosts \
    --tags=<your>,<tags>,<here>

Example
-------
By running the skeleton, you should see a lot of Docker output relating to
setting up the Debian base for Ansible. After a while, you will see this in the
output:

```
PLAY [localhost] **************************************************************

GATHERING FACTS ***************************************************************
ok: [localhost]

TASK: [debug msg="Running ansible!"] ******************************************
ok: [localhost] => {
    "msg": "Running ansible!"
}

PLAY RECAP ********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0
```

That's Ansible having run the playbook without any changes. By default, all we
do is print a debug message, showing that everything worked as expected. If you
see this, then you're ready to go! You can now modify the playbook in the
`ansible` directory as you see fit. You can add roles, vars, libraries, and
anything else as you see fit.
