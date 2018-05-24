process_option() {
	case "$1" in
		d)
			if should_change_default; then
				throw_error_for_attempting_to_both_create_and_change_default_a_resource
			fi
			set_create_as_true
			continue
			;;
		e)
			if should_create; then
				throw_error_for_attempting_to_both_create_and_change_default_a_resource
			fi
			set_change_default_as_true
			continue
			;;
		u)
			username=$OPTARG
			if should_change_default; then
				change_default_username
			fi
			;;
		i)
			ip_address=$OPTARG
			if should_change_default; then
				change_default_ip_address
			fi
			;;
		k)
			key_file_name=$OPTARG
			if should_change_default; then
				change_default_key_file
			fi
			;;
		p)
			profile_file_name=$OPTARG
			if should_create; then
				create_profile_file
			fi
			if should_change_default; then
				change_default_profile_file
			fi
			load_profile
			;;
		f)
			if should_create; then
				create_user_folders_and_files
			fi
			exit 0
			;;
	esac
}
