wget "https://en.wikipedia.org/wiki/${1}" > out.txt
cat out.txt | egrep 'interlanguage-link'  | egrep -o 'title="[^"]*' | sed 's/^title="//' | sed 's/ –.*//'
