freq:
	cat *.txt | egrep -o '[A-Za-z-]+' | sort | uniq -c | sort -r -n | sed 's/^ *\([0-9]*\) \(.*\)$$/\2,\1/' > $@
