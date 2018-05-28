set_as_true() {
	declare -g "$1"='true'
}

set_as_false() {
	declare -g "$1"='false'
}

set_load_as_true() {
	set_as_true 'load'
}

set_load_as_false() {
	set_as_false 'load'
}

set_create_as_true() {
	set_as_true 'create'
}

set_create_as_false() {
	set_as_false 'create'
}

set_designate_default_as_true() {
	set_as_true 'designate_default'
}

set_designate_default_as_false() {
	set_as_false 'designate_default'
}

initialize_actions() {
	set_create_as_false
	set_designate_default_as_false
}

should_do() {
	[ "$1" = 'true' ]
	return $?
}

should_load() {
	should_do "$load"
}

should_create() {
	should_do "$create"
}

should_designate_default() {
	should_do "$designate_default"
}