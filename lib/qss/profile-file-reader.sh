read_default_username() {
	printf $(cat "$1" | grep 'default_username=' | sed -r 's|default_username=||')
}

read_default_host_address() {
	printf $(cat "$1" | grep 'default_host_address=' | sed -r 's|default_host_address=||')
}

read_default_key_file_name() {
	printf $(cat "$1" | grep 'default_key_file_name=' | sed -r 's|default_key_file_name=||')
}