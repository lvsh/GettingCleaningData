## Code book for Getting and Cleaning Data Course Project

Description of the data, the variables,  and the transformations that are performed in run_analysis.R script.

### Data
The [UCI Human Activity Recognition (HAR) using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is used. This data was collected from 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist. Details of this data set can be found at link provided. 

### Variables
Measurements from the embedded accelerometer and gyroscope in the smartphone were analyzed as described in the documentation (e.g., features_info.txt)  provided in UCI HAR dataset to produce:

* Triaxial (X, Y, Z) measurements of total acceleration, estimated body acceleration, and angular velocity
* A 561-dimensional feature vector describing time and frequency domain variables estimated from sensor signals

In addition, the activity being performed and the subject wearing the smartphone were recorded.

### Transformations
The script run_analysis.R performs the following steps:

0. Reads in the UCI HAR data from files X_train.txt, subject_train.txt, y_train.txt, X_test.txt, subject_test.txt, and y_test.txt as data frames. Attaches subject index and activity index as additional columns to the *trainSet* and *testSet* dataframes.

1. Merges training and test sets to create a unified set (*fullSet* dataframe).

2. Extracts only those features from the 561-dimensional feature vector that contain `mean()` or `std()` in the feature names, which are provided in the features.txt file in UCI HAR data set. The *fullSet* dataframe is subset accordingly to retain only these features and their activity and subject ids. 

3. Descriptive activity labels are chosen based on activity_labels.txt file in UCI HAR data set. The Activity column in *fullSet* dataframe is transformed to a factor variable with levels: Walking, WalkingUpstairs, WalkingDownstairs, Sitting, Standing, and Laying.

4. Column names in *fullSet* dataframe are changed to the labels provided in features.txt file. Note that only the names of selected features from Step 2 are used, and the Subject and Activity column names stay unchanged.

5. Finally, an aggregated tidy data set is produced such that the mean of each selected variable is computed for each combination of activity category and subject id (*newSet* dataframe). The resulting data set has 6 activities x 30 subjects = 180 observations and 68 variables (= activity category + subject id + 66 selected features). This tidy data set is then written out to a file called NewDataSet.txt. 
