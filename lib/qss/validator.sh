validate_username() {
	is_valid_username() {
		username_regex='^[^@/~]{1,32}$'
		[[ "$1" =~ $username_regex ]]
		return $?
	}

	if is_valid_username "$1"; then
		return 0
	else
		echo "The provided username is invalid: $1"
		exit 2
	fi
}

validate_host_address() {
	is_valid_host_name() {
		host_name_regex='^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])(\.([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]{0,61}[a-zA-Z0-9]))*\.?$'
		[[ ! -z "$1" && $(printf $(printf "$1" | sed 's|\.$||') | wc -m) -le 253 && "$1" =~ $host_name_regex ]]
		return $?
	}

	if is_valid_host_name "$1"; then
		return 0
	else
		echo "The provided host address is invalid: $1"
		exit 2
	fi
}

validate_key_file() {
	is_valid_key_file() {
		key_file_regex='^\-\-\-\-\-BEGIN RSA PRIVATE KEY\-\-\-\-\-'
		[[ $(cat "$1") =~ $key_file_regex ]]
		return $?
	}

	if is_valid_key_file "$1"; then
		return 0
	else
		echo "The provided key file is invalid: $1"
		exit 2
	fi
}

validate_profile_file() {
	is_valid_profile_file() {
		profile_file_regex='^default_username=[^[:space:]]+ default_host_address=[^[:space:]]+ default_key_file_name=[^[:space:]]+ $'
		[[ -f "$1" && $(cat "$1" | tr -s '\n' ' ') =~ $profile_file_regex ]]
		return $?
	}

	if is_valid_profile_file "$1"; then
		validate_username $(read_default_username "$1")
		validate_host_address $(read_default_host_address "$1")
		validate_key_file $(get_key_file_path $(read_default_key_file_name "$1"))
		return 0
	else
		echo "Provided profile file is invalid: $1"
		exit 2
	fi
}