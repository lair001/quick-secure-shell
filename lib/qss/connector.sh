ssh_into_server() {
	validateUsername "$username"
	validate_host_address "$host_address"
	validateKeyFile $(get_key_file_path)
	ssh "$username"'@'"$host_address" -i $(get_key_file_path)
}