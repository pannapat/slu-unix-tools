cat word.txt | rev | paste word.txt - | egrep '^(.{1,}).\1$' | sort | uniq | sort -r -n
