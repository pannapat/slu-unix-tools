all: extract_and_tag_labels

prepare: clean
	mkdir -p ./people_html_files
	mkdir -p ./output

get_main_page: prepare
	wget -nc -O ./Lists_of_people_by_nationality.html https://en.wikipedia.org/wiki/Lists_of_people_by_nationality

download_by_country.sh: get_main_page
	cat Lists_of_people_by_nationality.html | egrep -o '<a href="/wiki/List_of[^"]*" ' | sed 's/<a href="//' | sed 's/" //' | sed 's/^/wget -nc -P .\/people_html_files\/ "https:\/\/en.wikipedia.org/' | sed 's/$$/"\nsleep 2/' > $@

run_download_by_country: download_by_country.sh
	bash $<

download_by_states.sh: run_download_by_country
	mv ./people_html_files/List_of_Americans .
	cat List_of_Americans | egrep -o '<li><a href="/wiki/[^"]*"' | sed 's/<li><a href="/wget -nc -P .\/people_html_files\/ "https:\/\/en.wikipedia.org/' | sed 's/$$/\nsleep 2/' > $@
	rm -f List_of_Americans

run_download_by_states: download_by_states.sh
	bash $<

extract_and_tag_labels: run_download_by_states
	bash tag_country_labels.sh

clean:
	rm -rf Lists_of_people_by_nationality.html ./people_html_files ./output download_list_people_by_country.sh download_usa_people_by_states.sh


