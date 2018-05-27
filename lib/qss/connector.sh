ssh_into_server() {
	validate_username "$username"
	validate_host_address "$host_address"
	validate_key_file $(get_key_file_path)
	ssh "$username"'@'"$host_address" -i $(get_key_file_path)
}