

validateUsername() {
	isValidUsername() {
		echo "$1" | grep -E '^[^@/~]{1,32}$' > /dev/null 2>&1
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
		[ -f "$1" ] && cat "$1" | grep -E '^\-\-\-\-\-BEGIN RSA PRIVATE KEY\-\-\-\-\-'
		return $?
	}

	if isValidKeyFile "$1"; then
		return 0
	else
		echo "The provided key file is invalid: $1"
		exit 2
	fi
}