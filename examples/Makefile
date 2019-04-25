all: accentedtags.txt
hashtags.txt: gd-tweets.txt
	cat gd-tweets.txt | egrep -o '#[A-Za-z0-9]+' | sort | uniq -c | sort -r -n > $@
accentedtags.txt: hashtags.txt
	cat hashtags.txt | egrep '[ÁÉÍÓÚáéíóúÀÈÌÒÙàèìòù]' | sed 's/^ *[0-9]* //' > $@

stripped.txt: accentedtags.txt
	cat accentedtags.txt | bash toascii.sh > $@
search.sh: stripped.txt accentedtags.txt
	paste accentedtags.txt stripped.txt | sed 's/\t/|/' | sed 's/^/egrep " (/' | sed 's/$$)$$" hashtags.txt; echo/' > $@
clean:
	rm -f stripped.txt accentedtags.txt hashtags.txt

