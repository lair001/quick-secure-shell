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
			set_change_default_as_true
			continue
			;;
		u)
			validateUsername "$OPTARG"
			if should_load; then
				username="$OPTARG"
			fi
			if should_change_default; then
				change_default_username "$OPTARG"
			fi
			;;
		h)
			if should_load; then
				host_address="$OPTARG"
			fi
			if should_change_default; then
				change_default_host_address "$OPTARG"
			fi
			;;
		k)
			validateKeyFile $(get_key_file_path "$OPTARG")
			if should_load; then
				key_file_name="$OPTARG"
			fi
			if should_change_default; then
				change_default_key_file "$OPTARG"
			fi
			;;
		p)
			if should_load; then
				profile_file_name="$OPTARG"
				load_profile
			fi
			if should_create; then
				create_profile_file "$OPTARG"
			fi
			if should_change_default; then
				change_default_profile_file "$OPTARG"
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
