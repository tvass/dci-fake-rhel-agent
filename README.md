1. Download your remoteci.sh from https://www.distributed-ci.io/
2. Change it from a "sh" file to "env" (see dcirc.env.dist for example)
3. mkdir a local .cache to avoid RHEL download at each run (~4Gi)
4. make build
5. make run
