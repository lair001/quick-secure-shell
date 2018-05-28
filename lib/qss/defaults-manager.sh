designate_default() {
	local field_name="$1"
	local new_field_value="$2"
	local path_for_file_containing_default_for_field="$3"

	local name_of_default_value_for_field="default_$field_name"
	sed -i "s|$name_of_default_value_for_field="${!name_of_default_value_for_field}"|$name_of_default_value_for_field=$new_field_value|g" "$path_for_file_containing_default_for_field"
}

designate_default_username() {
	designate_default 'username' "$1" $(get_profile_file_path)
}

designate_default_host_address() {
	designate_default 'host_address' "$1" $(get_profile_file_path)
}

designate_default_key_file() {
	designate_default 'key_file_name' "$1" $(get_profile_file_path)
}

designate_default_profile_file() {
	designate_default 'profile_file_name' "$1" "$config_file_path"
}