qss_user_directory_path="$HOME"'/qss/'
config_file_path="$qss_user_directory_path"'qss.conf'

get_key_file_path() {
	printf $keys_directory_path$key_file_name
}

get_profile_file_path() {
	printf $profiles_directory_path$profile_file_name
}