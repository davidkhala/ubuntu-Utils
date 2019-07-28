#!/usr/bin/env bash
remain_params=""
for ((i = 2; i <= $#; i++)); do
	j=${!i}
	remain_params="$remain_params $j"
done
install() {
	if ! mysql --version; then
		sudo apt install mysql-server
	fi
}
installWorkBench() {
	sudo apt install mysql-workbench
}
start() {
	systemctl start mysql
}
setRootPassword() {
	echo "targeted new password [$1]"
	sudo mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$1'"
	sudo systemctl restart mysql
}
connectionPoolSize() {
	sudo mysql -u root -p -e 'SHOW VARIABLES LIKE "max_connections"'
}
$1 $remain_params
