set_create_as_true() {
	create='true'
}

set_create_as_false() {
	create='false'
}

set_edit_as_true() {
	edit='true'
}

set_edit_as_false() {
	edit='false'
}

initialize_flags() {
	set_create_as_false
	set_edit_as_false
}

should_create() {
	[ "$create" = 'true' ]
	return $?
}

should_edit() {
	[ "$edit" = 'true' ]
	return $?
}