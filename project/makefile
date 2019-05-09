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

combined_dataset.csv:
	awk 1 output/*csv > $@

clean_combined_dataset.csv: combined_dataset.csv
	cat combined_dataset.csv | sed 's/"",".+//'| sed 's/^Afghan//' | sed 's/^African//' | sed 's/^African-American Jews//' | sed 's/^Albanian//' | sed 's/^Amish//' | sed 's/^Angolan//' | sed 's/^Antiguan and Barbudan//' | sed 's/^Arab//' | sed 's/^Argentine//' | sed 's/^Armenian//' | sed 's/^Asian//' | sed 's/^Assyrian//' | sed 's/^Australian//' | sed 's/^Austrian//' | sed 's/^Azerbaijani//' | sed 's/^Bahamian//' | sed 's/^Baloch//' | sed 's/^Bangladeshi//' | sed 's/^Barbadian//' | sed 's/^Belarusian//' | sed 's/^Belgian//' | sed 's/^Belizean//' | sed 's/^Beninese//' | sed 's/^Bermudian//' | sed 's/^Bolivian//' | sed 's/^Bosnian//' | sed 's/^Brazilian//' | sed 's/^Bulgarian//' | sed 's/^Burmese//' | sed 's/^Cajun//' | sed 's/^Cambodian//' | sed 's/^Cameroonian//' | sed 's/^Canadian//' | sed 's/^Caribbean//' | sed 's/^Chilean//' | sed 's/^Chinese//' | sed 's/^Fuzhou//' | sed 's/^Hakka//' | sed 's/^Taiwan//' | sed 's/^Hong Kong//' | sed 's/^Tibetan//' | sed 's/^Colombian//' | sed 's/^Congolese//' | sed 's/^Coptic//' | sed 's/^Cossack//' | sed 's/^Costa Rican//' | sed 's/^Croatian//' | sed 's/^Cuban//' | sed 's/^Cypriot//' | sed 's/^Czech//' | sed 's/^Danish//' | sed 's/^Dominican Americans (Dominica)//' | sed 's/^Dominican Americans (Dominican Republic)//' | sed 's/^Dutch//' | sed 's/^Ecuadorian//' | sed 's/^Egyptian//' | sed 's/^Emirati//' | sed 's/^English//' | sed 's/^Estonian//' | sed 's/^Ethiopian//' | sed 's/^Fijian//' | sed 's/^Filipino//' | sed 's/^Finnish//' | sed 's/^French//' | sed 's/^Gambian//' | sed 's/^Georgian//' | sed 's/^German//' | sed 's/^Ghanaian//' | sed 's/^Greek//' | sed 's/^Guatemalan//' | sed 's/^Guinean//' | sed 's/^Guyanese//' | sed 's/^Haitian//' | sed 's/^Hispanic and Latino//' | sed 's/^Hmong//' | sed 's/^Honduran//' | sed 's/^Hungarian//' | sed 's/^Icelandic//' | sed 's/^Indian//' | sed 's/^Bengali//' | sed 's/^Gujarati//' | sed 's/^Indo-Caribbean//' | sed 's/^Punjabi//' | sed 's/^Tamil//' | sed 's/^Indonesian//' | sed 's/^Iranian//' | sed 's/^Iraqi//' | sed 's/^Irish//' | sed 's/^Israeli//' | sed 's/^Italian//' | sed 's/^Ivorian//' | sed 's/^Jamaican//' | sed 's/^Japanese//' | sed 's/^Jews//' | sed 's/^Kazakh//' | sed 's/^Kenyan//' | sed 's/^Korean//' | sed 's/^Kurdish//' | sed 's/^Kuwaiti//' | sed 's/^Laotian//' | sed 's/^Latvian//' | sed 's/^Lebanese//' | sed 's/^Liberian//' | sed 's/^Lithuanian//' | sed 's/^Louisiana Creole//' | sed 's/^Luxembourg//' | sed 's/^Macedonian//' | sed 's/^Malawian//' | sed 's/^Malian//' | sed 's/^Maltese//' | sed 's/^Māori//' | sed 's/^Mexican//' | sed 's/^Monegasque//' | sed 's/^Montenegrin//' | sed 's/^Moroccan//' | sed 's/^Native American//' | sed 's/^Native Hawaiian//' | sed 's/^Nepalese//' | sed 's/^New Mexican//' | sed 's/^New Zealand//' | sed 's/^Nicaraguan//' | sed 's/^Nigerian//' | sed 's/^Norwegian//' | sed 's/^Pakistani//' | sed 's/^Baloch//' | sed 's/^Pashtun//' | sed 's/^Punjabi//' | sed 's/^Sindhi//' | sed 's/^Palauan//' | sed 's/^Palestinian//' | sed 's/^Panamanian//' | sed 's/^Paraguayan//' | sed 's/^Peruvian//' | sed 's/^Polish//' | sed 's/^Portuguese//' | sed 's/^Puerto Ricans//' | sed 's/^Stateside//' | sed 's/^Romani//' | sed 's/^Romanian//' | sed 's/^Russian//' | sed 's/^Rusyn//' | sed 's/^Salvadoran//' | sed 's/^Scotch-Irish//' | sed 's/^Scottish//' | sed 's/^Senegalese//' | sed 's/^Serbian//' | sed 's/^Sicilian//' | sed 's/^Singaporean//' | sed 's/^Slovak//' | sed 's/^Slovene//' | sed 's/^Somali//' | sed 's/^South African//' | sed 's/^South Asian//' | sed 's/^Bangladeshi//' | sed 's/^Bhutanese//' | sed 's/^Indian//' | sed 's/^Nepalese//' | sed 's/^Pakistani//' | sed 's/^Sri Lankan//' | sed 's/^South Sudanese//' | sed 's/^Spanish//' | sed 's/^Hispanos//' | sed 's/^Sri Lankan//' | sed 's/^Sudanese//' | sed 's/^Surinamese//' | sed 's/^Swedish//' | sed 's/^Swiss//' | sed 's/^Syrian//' | sed 's/^Tajikistani//' | sed 's/^Tanzanian//' | sed 's/^Thai//' | sed 's/^Tongan//' | sed 's/^Trinidadian and Tobagonian//' | sed 's/^Turkish//' | sed 's/^Ugandan//' | sed 's/^Ukrainian//' | sed 's/^Uruguayan//' | sed 's/^Uzbek//' | sed 's/^Venezuelan//' | sed 's/^Vietnamese//' | sed 's/^Welsh//' > $@

clean:
	rm -rf Lists_of_people_by_nationality.html ./people_html_files ./output download_list_people_by_country.sh download_usa_people_by_states.sh


