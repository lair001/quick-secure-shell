change_default_username() {
	sed -i "s/default_username=$default_username/default_username=$username/g" $(get_profile_file_path)
}

change_default_ip_address() {
	sed -i "s/default_ip_address=$default_ip_address/default_ip_address=$ip_address/g" $(get_profile_file_path)
}

change_default_key_file() {
	sed -i "s|default_key_file_name=$default_key_file_name|default_key_file_name=$key_file_name|g" $(get_profile_file_path)
}

change_default_profile_file() {
	sed -i "s|default_profile_file_name=$default_profile_file_name|default_profile_file_name=$profile_file_name|g" $config_file_path
}