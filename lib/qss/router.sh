qss_user_directory_path="$HOME"'/qss/'
config_file_path="$qss_user_directory_path"'qss.conf'

get_key_file_path() {
	local file_name="$key_file_name"
	if [ ! -z "$1" ]; then
		file_name="$1"
	fi
	printf "$keys_directory_path$file_name"
}

get_profile_file_path() {
	local file_name="$profile_file_name"
	if [ ! -z "$1" ]; then
		file_name="$1"
	fi
	printf "$profiles_directory_path$file_name"
}