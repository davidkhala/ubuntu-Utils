#!/usr/bin/env bash
install(){
    sudo apt install -y chrony
}
config(){
    vi /etc/chrony/chrony.conf
}
serviceRestart(){
    sudo /etc/init.d/chrony restart
}
status(){
    chronyc sources -v
    chronyc tracking
}
help(){
    echo "Reference in https://docs.aws.amazon.com/zh_cn/AWSEC2/latest/UserGuide/set-time.html"
    echo "chrony use port: UDP 323"
}
sync(){
    sudo chronyc makestep
}

$1