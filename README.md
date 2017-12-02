
# RT-Thread Lab

RT-Thread is an open source IoT operating system from China.

* [RT-Thread Homepage](http://www.rt-thread.org)
* [RT-Thread Git Repo](https://github.com/rt-thread)

To easier the learning and development of RT-Thread, this lab is added as a plugin of [Cloud Lab](http://tinylab.org/cloud-lab).

The following sections introduce the using of RT-Thread on Qemu with Cloud Lab:

* [RT-Thread Lab Homepage](http://tinylab.org/rtthread-lab)
* [RT-Thread Lab Demo](http://showterm.io/3b7829850b0417690ad41)

## Install Docker

Docker is required by RT-Thread Lab, please install it at first:

* Linux and Mac OSX: [Docker CE](https://store.docker.com/search?type=edition&offering=community)
* Windows: [Docker Toolbox](https://www.docker.com/docker-toolbox)

Notes:

In order to run docker without password, please make sure your user is added in the docker group:

    $ sudo usermod -aG docker $USER

In order to speedup docker images downloading, please configure a local docker mirror in `/etc/default/docker`, for example:

    $ grep registry-mirror /etc/default/docker
    DOCKER_OPTS="$DOCKER_OPTS --registry-mirror=https://docker.mirrors.ustc.edu.cn"
    $ service docker restart

In order to avoid network ip address conflict, please try following changes and restart docker:

    $ grep bip /etc/default/docker
    DOCKER_OPTS="$DOCKER_OPTS --bip=10.66.0.10/16"
    $ service docker restart

If the above changes not work, try something as following:

    $ grep dockerd /lib/systemd/system/docker.service
    ExecStart=/usr/bin/dockerd -H fd:// --bip=10.66.0.10/16 --registry-mirror=https://docker.mirrors.ustc.edu.cn
    $ service docker restart

For Ubuntu 12.04, please install the new kernel at first, otherwise, docker will not work:

    $ sudo apt-get install linux-generic-lts-trusty

## Choose a working directory

If installed via Docker Toolbox, please enter into the `/mnt/sda1` directory of the `default` system on Virtualbox, otherwise, after poweroff, the data will be lost for the default `/root` directory is only mounted in DRAM.

    $ cd /mnt/sda1

For Linux or Mac OSX, please simply choose one directory in `~/Downloads` or `~/Documents`.

    $ cd ~/Documents

## Download the lab

Use Ubuntu system as an example:

Download cloud lab framework, pull images and checkout rtthread-lab repository:

    $ git clone https://github.com/tinyclub/cloud-lab.git
    $ cd cloud-lab/ && tools/docker/choose rtthread-lab

## Run and login the lab

Launch the lab and login with the user and password printed in the console:

    $ tools/docker/run rtthread-lab

Re-login the lab via web browser:

    $ tools/docker/vnc rtthread-lab

## Use the lab

After login, Open 'RT-Thread Lab' in the desktop and it will enter into the working directory: `/labs/rtthread-lab/`,

### Update source code

    $ make init

### Build rt-thread for qemu-vexpress-a9

    $ make build

### Boot it on qemu without graphic

    $ make boot

### Boot in on qemu with graphic

After booting, switch to the 4th terminal via `CTRL+ALT+4`:

    $ make boot G=1
