# docker-ansible-control-node
A docker container for running ansible and the [HypercoreAnsibleCollection](https://github.com/ScaleComputing/HyperCoreAnsibleCollection).

## Setup
Install [Docker Desktop](https://www.docker.com/products/docker-desktop/).

Setup local environment variables to set username, password, and host (target node in a Hypercore cluster).

```
export SC_USERNAME=admin
export SC_PASSWORD=<PASSWORD>
export SC_HOST=https://scalecluster.example.com
```

Run build.sh to build the container.

```
./build.sh
```

Start the container, and drop into the shell:

```
./run.sh
```

Run and example ansible playbook!

```
ansible-playbook examples/iso_info.yml
```