function lsblk
	/usr/bin/lsblk -f -o NAME,MOUNTPOINT,SIZE,LABEL,FSTYPE,UUID $argv
end
