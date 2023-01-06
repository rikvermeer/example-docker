# Example docker

This (example) docker intends to help with the following:
- bin dir with scripts for building/running
- - bin scripts can be called with relative path but converts to absolute paths
- docker dir with Dockerfile and context
- - context that adds current user with the same user/group id/name
- provide a template that can be copied and act as a skeleton/base
- - easily adjustable docker tag by editing ```docker-tag-export.sh```

## Folders, paths and relatives
To build a docker image, run a container and bind the environment it is needed to get to the absolute paths.

When calling a script from an arbitrary place we'd like to know the following:
- where is the script called from
- where is the script located
- what is the scripts name / basename of the script in the given command
- what is the scripts dir / basedir of the script in the given command
- what is the root path concerning to the script

With this information we can bootstrap the whole context in a generic way

## User info
When building code inside of a container it's handy to get the built files owned by the current user.
