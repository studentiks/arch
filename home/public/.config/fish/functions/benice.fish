function benice
	renice -n 19 -p %self
	and ionice -c3 -p %self
	and ionice -p %self
end
