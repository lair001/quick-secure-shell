read_default_keys_directory_path() {
	local file_path="$1"
	local home_expansion_result=$(read_field_from_file_and_do_home_expansion 'default_keys_directory_path' "$file_path")
	printf "$home_expansion_result"
}

read_default_profiles_directory_path() {
	printf $(cat "$1" | grep 'default_profiles_directory_path=' | sed -r 's|default_profiles_directory_path=||' | sed -r 's:~|\$HOME:'"$HOME"':')
}

read_default_profile_file_name() {
	local file_path="$1"
	local read_result=$(read_field_from_file 'default_profile_file_name' "$file_path")
	printf "$read_result"
}