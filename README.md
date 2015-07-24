## Coursera Getting Data week 3 course project

### Introduction
Hello fellow Coursera student,

This is my submission for the week 3 course project of the Coursera Getting and cleaning data (getdata-030). This 
readme file will describe what you can find in the repo.

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
This markdown file contains the codebook for summary_tidy.txt. In it, each variable is described
as well as which transformations led to the dataset from the raw data.

### summary_tidy.txt
This is the summarized dataset as requested in the course project. You can read it in using the following code:

download.file("https://github.com/victorvdb/getdata3/summary_tidy.txt", "summary_tidy.txt")
summary.tidy <- read.table("summary_tidy.txt", header=TRUE)

Thanks to David Hood's post on the coursera forums for this tidbit of code
(https://class.coursera.org/getdata-030/forum/thread?thread_id=37)



