read_default_keys_directory_path() {
	printf $(cat "$1" | grep 'default_keys_directory_path=' | sed -r 's|default_keys_directory_path=||' | sed -r 's:~|\$HOME:'"$HOME"':')
}

read_default_profiles_directory_path() {
	printf $(cat "$1" | grep 'default_profiles_directory_path=' | sed -r 's|default_profiles_directory_path=||' | sed -r 's:~|\$HOME:'"$HOME"':')
}

read_default_profile_file_name() {
	local read_result=$(cat "$1" | grep 'default_profile_file_name=' | sed -r 's|default_profile_file_name=||')
	printf "$read_result"
}