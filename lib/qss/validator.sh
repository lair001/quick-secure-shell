

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