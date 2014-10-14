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
