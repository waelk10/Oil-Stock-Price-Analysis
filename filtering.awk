BEGIN {
	FS = ","
}

NR==FNR {
	if (FNR > 1) {
		seen[$1] = 1
	}
	next
}
{
	if (NR > FNR) {
		if ($1 in seen) {
			print
		}
	}
}
