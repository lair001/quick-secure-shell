read_default_keys_directory_path() {
	local file_path="$1"
	local read_result=$(read_path_from_file 'default_keys_directory_path' "$file_path")
	printf "$read_result"
}

read_default_profiles_directory_path() {
	local file_path="$1"
	local read_result=$(read_path_from_file 'default_profiles_directory_path' "$file_path")
	printf "$read_result"
}

read_default_profile_file_name() {
	local file_path="$1"
	local read_result=$(read_field_from_file 'default_profile_file_name' "$file_path")
	printf "$read_result"
}