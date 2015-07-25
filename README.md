## Coursera Getting Data week 3 course project

### Introduction
Hello fellow Coursera student,

This is my submission for the week 3 course project of the Coursera Getting and cleaning data (getdata-030). This readme file will describe what you can find in the repo.

### Files
The following files are in the repo:

* README.md               
* CodeBook.md             
* summary_tidy.txt        
* run_analysis.R          

Description of each file is in the following sections.

### README.md
This file, containing general information about the repository and each of the files inside it

### CodeBook.md
This markdown file contains the codebook for summary_tidy.txt. It contains the data dictionary for the tidy dataset in this repo.

### summary_tidy.txt
This is the summarized dataset as requested in the course project. You can read it in using the following code:

```{r}
download.file("https://raw.githubusercontent.com/victorvdb/getdata3/master/summary_tidy.txt", "summary_tidy.txt")
summary.tidy <- read.table("summary_tidy.txt", header=TRUE)
view(summary.tidy)
```

Thanks to David Hood's post on the coursera forums for this tidbit of code (https://class.coursera.org/getdata-030/forum/thread?thread_id=37)

### run_analysis.R
This is the script file that will perform the following activities:

* download the samsung galaxy s II data from the website, unzip it and set working directory
* load the appropriate libraries (packages need to already be installed)
* extracts the different datasets from the website data
* merges the datasets into one
* makes sure the activity type is readable by humans (e.g. "WALKING" instead of 1)
* renames all important variables to the descriptions provided
* aggregates and reshapes the data into the tidy dataset provided in this repo
* save the tidy dataset to a txt file

Extensive descriptions of what is being done can be found in the comments of the script. I have chosen to retain the variables that originally contained std() and mean() for the course project. There were other variables containing meanFreq() and so forth, but those fall outside of the required fields as far as I understand.

Required packages are:

* dplyr
* plyr
* reshape2

If you already have downloaded the raw data from the website, make sure the working directory is the one where the root of that ZIP file was extracted to (Usually /UCI HAR Dataset/)



