#!/usr/bin/env bash
set -e

upgrade() {
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt update
    sudo apt install git -y
}
$@
