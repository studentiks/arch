function ncat
	# cat file with no comments
    cat $argv | grep -v -E "^(;|#|//|\s*\$)"
end
