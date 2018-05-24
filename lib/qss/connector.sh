ssh_into_server() {
	if [ ! -z "$username" ]; then
		if [ ! -z "$ip_address" ]; then
			if [ -f "$get_key_file_path" ]; then
				ssh "$username"'@'"$ip_address" -i $(get_key_file_path)
				exit 0
			else
				echo "Cannot SSH. No key file loaded."
				exit 2
			fi
		else
			echo "Cannot SSH. No ip address loaded."
			exit 2
		fi
	else
		echo "Cannot SSH. No username loaded."
		exit 2
	fi
}