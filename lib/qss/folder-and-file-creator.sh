create_profile_file() {
	touch $(get_profile_file_path "$1")
	chmod 600 $(get_profile_file_path "$1")
	printf 'default_username='"$username"'\n' >> $(get_profile_file_path "$1")
	printf 'default_host_address='"$host_address"'\n' >> $(get_profile_file_path "$1")
	printf 'default_key_file_name='"$key_file_name"'\n' >> $(get_profile_file_path "$1")
}

create_user_directory() {
	if [ ! -e "$qss_user_directory_path" ]; then
		mkdir "$qss_user_directory_path"
		chmod 700 "$qss_user_directory_path"
	fi
}

create_user_keys_directory() {
	if [ ! -e "$qss_user_directory_path"'keys' ]; then
		mkdir "$qss_user_directory_path"'keys'
		chmod 700 "$qss_user_directory_path"'keys'
	fi
}

create_user_profiles_directory() {
	if [ ! -e "$qss_user_directory_path"'profiles' ]; then
		mkdir "$qss_user_directory_path"'profiles'
		chmod 700 "$qss_user_directory_path"'profiles'
	fi
}

create_user_configuration_file() {
	if [ ! -e "$config_file_path" ]; then
		touch "$config_file_path"
		chmod 600 "$config_file_path"
		printf 'default_keys_directory_path=~/qss/keys/\n' >> "$config_file_path"
		printf 'default_profiles_directory_path=~/qss/profiles/\n' >> "$config_file_path"
		printf 'default_profile_file_name=\n' >> "$config_file_path"
	fi
}

create_user_folders_and_files() {
	if [ -f $(echo "$qss_user_directory_path" | sed -r 's|/$||') ]; then
		echo "Aborting since desired qss user directory path $qss_user_directory_path already exists as an ordinary file (i.e. not a directory)."
		exit 2
	fi
	create_user_directory
	create_user_keys_directory
	create_user_profiles_directory
	create_user_configuration_file
}