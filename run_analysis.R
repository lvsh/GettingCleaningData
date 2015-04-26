# Step 0. Read UCI HAR Samsung dataset
# Read and consolidate training set 
trainSet <- read.csv("train/X_train.txt",header=FALSE,sep="")
trainSubject <- read.csv("train/subject_train.txt",header=FALSE,sep="")
trainSet$Subject <- trainSubject$V1
trainActivity <- read.csv("train/y_train.txt",header=FALSE,sep="")
trainSet$Activity <- trainActivity$V1
# Read and consolidate test set 
testSet <- read.csv("test/X_test.txt",header=FALSE,sep="")
testSubject <- read.csv("test/subject_test.txt",header=FALSE,sep="")
testSet$Subject <- testSubject$V1
testActivity <- read.csv("test/y_test.txt",header=FALSE,sep="")
testSet$Activity <- testActivity$V1

# Step 1. Merge the training and the test sets to create one data set
# Merge sets 
fullSet <- merge(trainSet,testSet,all=TRUE)
rm(trainSet,trainSubject,trainActivity,testSet,testSubject,testActivity)

# Step 2. Extract only the measurements on the mean and standard deviation for each measurement
# Read feature labels
featureLabels <- read.csv("features.txt",header=FALSE,sep="")
# Select only the mean and std for each measurement 
selectThese <- grep("mean\\(\\)|std\\(\\)",featureLabels[,2])
featureLabels <- featureLabels[selectThese,]
# Extract selected measurements + subject id + activity id from data set
fullSet <- fullSet[,c(selectThese,562,563)]
rm(selectThese)

# Step 3. Use descriptive activity names to name the activities in the data set
# Read activity labels
activityLabels <- read.csv("activity_labels.txt",header=FALSE,sep="")
print(activityLabels)
x <- as.factor(fullSet$Activity)
levels(x) <- list(Walking="1",WalkingUpstairs="2",WalkingDownstairs="3",Sitting="4",Standing="5",Laying="6")
fullSet$Activity <- x
rm(x)

# Step 4. Appropriately label the data set with descriptive variable names
colnames(fullSet) <- c(as.character(featureLabels$V2),"Subject","Activity")

# Step 5. Create second data set with the average of each variable for each activity and each subject
newSet <- aggregate(. ~ Activity + Subject,data=fullSet,mean)
write.table(newSet,file="NewDataSet.txt",quote=FALSE,sep="\t",eol="\n",row.names=FALSE)

