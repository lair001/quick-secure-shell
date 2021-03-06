load_configuration() {
	validate_configuration_file "$config_file_path"

	default_keys_directory_path=$(read_default_keys_directory_path "$config_file_path")
	default_profiles_directory_path=$(read_default_profiles_directory_path "$config_file_path")
	default_profile_file_name=$(read_default_profile_file_name "$config_file_path")

	keys_directory_path="$default_keys_directory_path"
	profiles_directory_path="$default_profiles_directory_path"

	if [ ! -z "$default_profile_file_name" ]; then
		validate_profile_file $(get_profile_file_path "$default_profile_file_name")
		load_profile "$default_profile_file_name"
	fi
}

load_profile() {
	if [ ! -z "$1" ]; then
		profile_file_name="$1"
	fi

	local profile_file_path=$(get_profile_file_path)

	default_username=$(read_default_username "$profile_file_path")
	default_host_address=$(read_default_host_address "$profile_file_path")
	default_key_file_name=$(read_default_key_file_name "$profile_file_path")

	username="$default_username"
	host_address="$default_host_address"
	key_file_name="$default_key_file_name"
}
