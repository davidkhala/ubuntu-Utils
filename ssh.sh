#!/usr/bin/env bash
set -e
sshPass() {
    if ! sshPass >/dev/null 2>&1; then
        sudo apt install sshpass
    fi
}
genRSA() {
    local keySize
    local email
    local rsaKeyPrv
    read -p "enter email (default:david-khala@hotmail.com):" email
    read -p "enter keySize (default:4096) :" keySize
    keySize=${keySize:-4096}
    email=${email:-"david-khala@hotmail.com"}
    ssh-keygen -t rsa -b $keySize -C $email
    eval "$(ssh-agent -s)"

    read -p "Enter key file path again ($HOME/.ssh/id_rsa):" rsaKeyPrv
    rsaKeyPrv=${rsaKeyPrv:-"$HOME/.ssh/id_rsa"}
    ssh-add $rsaKeyPrv
}
copyRSAPub() {
    sudo apt install -qq -y xclip
    # xclip does not work on ubuntu server: [Error: Can't open display: (null)]
    if ! xclip -sel clip <~/.ssh/id_rsa.pub; then
        echo ---- xclip does not work on current terminal. Please manually copy following:
        cat ~/.ssh/id_rsa.pub
    fi
}
$1
