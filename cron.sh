#!/usr/bin/env bash
fcn="$1"
remain_params=""
for ((i = 2; i <= $#; i++)); do
	j=${!i}
	remain_params="$remain_params $j"
done
sysCronTab="/etc/crontab"
function addJob() {
    local newLine=$remain_params
    echo "*  *	* * *	root	$newLine" | sudo tee -a $sysCronTab
    sudo /etc/init.d/cron restart
}
viewLog(){
    sudo /etc/init.d/cron restart
    SYSLOG=/var/log/syslog
    sudo grep cron $SYSLOG
}
$fcn $remain_params

