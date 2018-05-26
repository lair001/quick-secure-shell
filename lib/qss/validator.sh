validateUsername() {
	isValidUsername() {
		username_regex='^[^@/~]{1,32}$'
		[[ "$1" =~ $username_regex ]]
		return $?
	}

	if isValidUsername "$1"; then
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

validateKeyFile() {
	isValidKeyFile() {
		key_file_regex='^\-\-\-\-\-BEGIN RSA PRIVATE KEY\-\-\-\-\-'
		[[ $(cat "$1") =~ $key_file_regex ]]
		return $?
	}

	if isValidKeyFile "$1"; then
		return 0
	else
		echo "The provided key file is invalid: $1"
		exit 2
	fi
}