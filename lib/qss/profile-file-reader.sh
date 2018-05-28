read_default_username() {
	local file_path="$1"
	local read_result=$(read_field_from_file 'default_username' "$file_path")
	printf "$read_result"
}

read_default_host_address() {
	local file_path="$1"
	local read_result=$(read_field_from_file 'default_host_address' "$file_path")
	printf "$read_result"
}

read_default_key_file_name() {
	local file_path="$1"
	local read_result=$(read_field_from_file 'default_key_file_name' "$file_path")
	printf "$read_result"
}