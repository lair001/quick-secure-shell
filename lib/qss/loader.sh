load_configuration() {
	if [ $config_file_path ] && [ -f $config_file_path ]; then
		source $config_file_path
		keys_directory_path=$default_keys_directory_path
		profiles_directory_path=$default_profiles_directory_path
		profile_file_name=$default_profile_file_name
	fi
}

load_profile() {
	if [ $profiles_directory_path$profile_file_name ] && [ -f $profiles_directory_path$profile_file_name ]; then
		source $profiles_directory_path$profile_file_name
		username=$default_username
		host_address=$default_host_address
		key_file_name=$default_key_file_name
	fi
}
