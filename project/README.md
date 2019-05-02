# Unix Tools Project

## Motivation
This project is part of my Machine Learning course's project which training a classification model to predict a country of origin from a person's name.
Learning many Unix tools is very useful and powerful in terms of doing text-processing. It make data preprocessing such as web scraping, data cleaning, data transformation simpler.

## What it does
**This project functionalities are:**
1. Download [List of people by nationality's Wikipedia page](https://en.wikipedia.org/wiki/Lists_of_people_by_nationality)
2. Extract a link to each wiki page that provides people's name of all countries.
3. Generate a bash script that downloads all wiki pages from Step 2.
4. Execute the bash script from Step 3.
5. For the wiki page of people in America, there's links to each states' people which requires an extra step: Extract a link to each states' people wiki page 
6. Generate a bash script that downloads all wiki pages from Step 5.
7. Execute the bash script from Step 6.
8. Loop through all countries and states's people's name list file to
    * Extract fullnames and store as csv files
    * Add a country name to the second column for using as labels of training data

## How to run
```
$ make all
```

If you've run it before, you may need to clean the generated files by running the command
```
$ make clean
```

## How it works
- the directories ```people_html_files``` and ```output``` will be created by a task ```prepare``` in makefile
- All html file will be downloaded to a directory named "people_html_files"
- Only the [country list page](https://en.wikipedia.org/wiki/Lists_of_people_by_nationality) will be download to the root directory of project
- The bash script will be generated to the root directory of the project named ```download_by_country.sh``` and ```download_by_states.sh```
- Output files will be generated in CSV format to ```output``` directory
- ``` $ make clean``` will remove all generated directories and files
- All ```wget``` commands are added the option ```-nc``` to skip the retrieval if the file already exists

## Unix tools Used
- ```bash```
- ```cat```
- ```egrep```
- ```for```
- ```ls```
- ```make```
- ```mkdir```
- ```mv```
- ```rm```
- ```sed```
- ```wget```

## Samples of output files and downloaded html files
You can run the makefile yourself or look at all the generated scripts, output and downloaded files in "[archive](https://github.com/pannapat/slu-unix-tools/tree/master/project/archive)" directory.

The following screenshot show a sample of output file that contains Thai people's names.
![alt text](https://github.com/pannapat/slu-unix-tools/blob/master/project/archive/screenshots/ss_thais_name_output.png?raw=true)

## Limitations
- As you can see from the screenshot above, the labels of the output data are not clean country names ("List-of_Thais" instead of "Thais"). Now it uses the name from each country's page downloaded.
- Some of the names extracted from the pages are not actually people's name but some other link in the wiki page that I cannot find the distinct pattern to get rid of those. I need to filter them out by hand before using it in the Machine Learning project.
