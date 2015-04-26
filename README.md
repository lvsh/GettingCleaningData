## Getting and Cleaning Data Course Project

In this project, data from [UCI Human Activity Recognition (HAR) using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is used to create a tidy data set containing a subset of the original measurements aggregated over each activity and each subject. 

### Obtaining the tidy data set
The tidy data set is obtained by running the `run_analysis.R` script. This script assumes that the UCI HAR data is in the working directory, and it performs the following steps:

* Merges training and test sets of UCI HAR data
* Selects a subset of the measurements in UCI HAR data
* Provides descriptive activity names based on UCI HAR data
* Provides descriptive features labels based on UCI HAR data
* Creates an independent tidy data set with average of selected measurements for each activity and each subject   

### Codebook
Please refer to `CodeBook.md` for details of the variables, the data, and the transformations that were performed.  
