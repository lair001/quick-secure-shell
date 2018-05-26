ssh_into_server() {
	validateUsername "$username"
	validate_host_address "$host_address"
	validateKeyFile $(get_key_file_path)
	if [ ! -z "$host_address" ]; then
		ssh "$username"'@'"$host_address" -i $(get_key_file_path)
		exit 0
	else
		echo "Cannot SSH. No ip address loaded."
		exit 2
	fi
}