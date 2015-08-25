function mime
	set c (count $argv)
	if test $c -eq 0
		echo Usage:
		echo mime FILE \# gets mime desktop
		echo mime FILE file.desktop \# sets mime desktop
		return
	end

	set mimetype (/usr/bin/xdg-mime query filetype $argv[1])
	set mimedefault (/usr/bin/xdg-mime query default $mimetype)

	if test $c -eq 2
		set mimedefault $argv[2]
		/usr/bin/xdg-mime default $mimedefault $mimetype
	end

	echo $mimetype\n$mimedefault
end
