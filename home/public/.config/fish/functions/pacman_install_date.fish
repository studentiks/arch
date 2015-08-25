function pacman_install_date
	pacman -Qi | grep -P "^(Name|Install Date)"
end
