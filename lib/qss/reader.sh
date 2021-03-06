read_field_from_file() {
	local field_name="$1"
	local file_path="$2"

	local read_result=$(cat "$file_path" | grep "$field_name"'=' | sed -r 's|'"$field_name"'=||')
	printf "$read_result"
}

read_path_from_file() {
	local field_name="$1"
	local file_path="$2"

	local read_result=$(read_field_from_file "$field_name" "$file_path" | sed -r 's:~|\$HOME:'"$HOME"':')
	printf "$read_result"
}