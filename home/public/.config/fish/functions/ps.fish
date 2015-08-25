function ps
	/usr/bin/ps -o etime,%cpu,sgi_p,uname,pid,comm,args --sort=pid -u $USER $argv
end
