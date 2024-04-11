#!/usr/bin/env bash
# Install Docker
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
# https://docs.docker.com/compose/install/

porject_path=$(pwd)
source ${porject_path}/lib/init.sh

soft::docker::install() {
	soft::util::sudo "apt-get install -y ca-certificates curl gnupg"

	curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
	# Set up the repository
	echo ${LINUX_PASSWORD} | sudo -S add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
	# Update the apt package index
	soft::util::sudo "apt-get update"
	# Install the latest version of Docker CE
	# Add user to docker group

	# Install Docker Composer
	soft::util::sudo "apt-get install -y docker-ce docker-ce-cli containerd.io"
	# Add user to docker group
	echo ${LINUX_PASSWORD} | sudo -i usermod -aG docker $USER
	# Add user to docker group
	soft::util::sudo "newgrp docker"

	# start docker
	soft::util::sudo "systemctl start docker"
	# enable docker
	soft::util::sudo "systemctl enable docker"
}

soft::docker::uninstall() {
	for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do soft::util::sudo "apt-get remove $pkg -y"; done
}

soft::docker::test() {
	soft::util::sudo "apt-get install docker-ce -y"
}

if [[ "$*" =~ "soft::docker::" ]]; then
	eval $*
fi
