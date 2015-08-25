function myip
	curl -sL http://ddg.gg/\?q=my%20ip  | grep -oP "Your IP address is [0-9.]+"
end
