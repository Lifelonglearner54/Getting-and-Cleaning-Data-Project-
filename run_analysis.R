
# Set the Working directory
# Replace this with the actual working directory in your environment
# where you have unzipped the data file Dataset.zip
    setwd ("D:/GCD_PROJECT")

# Load the Libraries
    library("data.table")
    library("plyr")
    
# Load the features.txt file to get the column names

  tblFeature<-read.table("features.txt",header=F)
  paste ("Features.txt table loaded succesfully ....")
  
# Load the X-train.txt file 
	tblXtrain<-read.table("./train/X_train.txt",header=F)
# Assign the column names from the tblFeature
	colnames(tblXtrain)<-tblFeature[,2]
	paste ("X_train.txt table loaded succesfully ....")
	
# Load the y-train.txt file 
	tblYtrain<-read.table("./train/y_train.txt",header=F,col.names=c('Code'))
	paste ("y_train.txt table loaded succesfully ....")
# Load the Activity Lables file
	tblActivityLables<-read.table("activity_labels.txt",header=F,col.names=c('Code','Activity'))
	paste ("activity_labels.txt table loaded succesfully ....")
# Load the subject_train.txt file
	tblSTrain<-read.table("./train/subject_train.txt",header=F,col.names=c('Subject'))
	paste ("subject_train.txt table loaded succesfully ....")
# Merge Activity Labels and ytrain to assign the activity name to ytrain table 
	tblActTrain<-merge(tblActivityLables,tblYtrain,by.tblActivityLables="Code",by.tblYtrain="Code")
# Form a single Train data set binding XTrain, ActTrain and Subject tables
		tblTrain<-cbind(tblActTrain[,2],tblSTrain,tblXtrain)
		colnames(tblTrain)[1]="Activity"
		paste ("Table Train formed succesfully ....")

# Load the X-test.txt file 
	tblXtest<-read.table("./test/X_test.txt",header=F)
# Assign the column names from the tblFeature
	colnames(tblXtest)<-tblFeature[,2]
	paste ("X_test.txt table loaded succesfully ....")
	
# Load the y-test.txt file 
	tblYtest<-read.table("./test/y_test.txt",header=F,col.names=c('Code'))
	paste ("y_test.txt table loaded succesfully ....")

# Load the subject_test.txt file
	tblSTest<-read.table("./test/subject_test.txt",header=F,col.names=c('Subject'))
	paste ("subject_test.txt table loaded succesfully ....")
# Merge Activity Labels and ytest to assign the activity name to ytest table 
	tblActTest<-merge(tblActivityLables,tblYtest,by.tblActivityLables="Code",by.tblYtest="Code")
# Form a single Test data set binding XTest, ActTest and Subject tables
		tblTest<-cbind(tblActTest[,2],tblSTest,tblXtest)
		colnames(tblTest)[1]="Activity"
		paste ("Table Test formed succesfully ....")

# Form a Merged Data Set of Train and Test Tables
		tblFinal<-rbind(tblTrain,tblTest)
		paste ("Train and Test tables merged succesfully ....")
		
# Make an expression to Extract Mean and Std column names from cobined dataset
		expr="[Mm]ean()|std()|Activity|Subject"
# Extract table containing only the mean and standar deviation
		tblExtract<-tblFinal[,grep(expr,colnames(tblFinal),value=TRUE)]
		paste ("Extracted table of Mean and Standard deviation columns ....")

# Modify the column names 	
		names(tblExtract) <- gsub("Acc", "Accelerator", names(tblExtract))
		names(tblExtract) <- gsub("Mag", "Magnitude", names(tblExtract))
		names(tblExtract) <- gsub("Gyro", "Gyroscope", names(tblExtract))
		names(tblExtract) <- gsub("^t", "Time", names(tblExtract))
		names(tblExtract) <- gsub("^f", "Frequency", names(tblExtract))
		paste ("Changed the lables with descriptive column names ....")

# Create tidy data set with average of each variable by Acticity and Subject		
		tblTidydataset<-ddply(tblExtract,.(Activity,Subject),numcolwise(mean))
		write.table(tblTidydataset, file = "Tidydataset.txt", row.names = FALSE)
		paste ("Successfully created the tidy data set ....")
