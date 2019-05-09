#!/bin/bash
for file in ./people_html_files/*; do
	country_name=${file##*/}
	echo "Extracting people's name from $country_name ..."
	cat ./people_html_files/$country_name| egrep -o '<li><a href="/wiki/.*" title=".*">(.*)</a>.*' | sed 's/<li><a[^>]*>/"/' | sed 's/<[^>]*>//g' | sed "s/<\/a>.*$/\",\"$country_name\"/" > "./output/names_$country_name.csv"
	done
