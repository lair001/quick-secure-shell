process_option() {
	case "$1" in
		l)
			set_load_as_true
			continue
			;;
		c)
			set_create_as_true
			continue
			;;
		d)
			set_designate_default_as_true
			continue
			;;
		u)
			validate_username "$OPTARG"
			if should_load; then
				username="$OPTARG"
			fi
			if should_designate_default; then
				designate_default_username "$OPTARG"
				username="$OPTARG"
			fi
			;;
		h)
			validate_host_address "$OPTARG"
			if should_load; then
				host_address="$OPTARG"
			fi
			if should_designate_default; then
				designate_default_host_address "$OPTARG"
				host_address="$OPTARG"
			fi
			;;
		k)
			validate_key_file $(get_key_file_path "$OPTARG")
			if should_load; then
				key_file_name="$OPTARG"
			fi
			if should_designate_default; then
				designate_default_key_file "$OPTARG"
				key_file_name="$OPTARG"
			fi
			;;
		p)
			if should_create; then
				create_profile_file "$OPTARG"
			fi
			validate_profile_file $(get_profile_file_path "$OPTARG")
			if should_load; then
				load_profile "$OPTARG"
			fi
			if should_designate_default; then
				designate_default_profile_file "$OPTARG"
				load_profile "$OPTARG"
			fi
			;;
		f)
			if should_create; then
				create_user_folders_and_files
			fi
			;;
		s)
			ssh_into_server
			;;
	esac
}
