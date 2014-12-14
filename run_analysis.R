library(dplyr)

xtrain <- read.table("C:\\Users\\gilbert\\Documents\\UCI HAR Dataset\\train\\X_train.txt")
ytrain <- read.table("C:\\Users\\gilbert\\Documents\\UCI HAR Dataset\\train\\Y_train.txt")
xtest <- read.table("C:\\Users\\gilbert\\Documents\\UCI HAR Dataset\\test\\X_test.txt")
ytest <- read.table("C:\\Users\\gilbert\\Documents\\UCI HAR Dataset\\test\\Y_test.txt")
strain <- read.table("C:\\Users\\gilbert\\Documents\\UCI HAR Dataset\\train\\subject_train.txt")
stest <- read.table("C:\\Users\\gilbert\\Documents\\UCI HAR Dataset\\test\\subject_test.txt")
activity_labels <- read.table("C:\\Users\\gilbert\\Documents\\UCI HAR Dataset\\activity_labels.txt")
features <- read.table("C:\\Users\\gilbert\\Documents\\UCI HAR Dataset\\features.txt")
features <- as.character(features[,2])

test <- cbind(stest,ytest,xtest)
train <- cbind(strain,ytrain,xtrain)
data <- rbind(train,test)
names(data) <- c("Subject","Activity", features)

### some column names are duplicated.  None contain mean or std info, so remove them
data <- data[,!duplicated(colnames(data))]

### select only those columns containing "mean()", "std()", 
### and the Activity and Subject cols
data <- select(data, Subject, Activity, contains("mean()"), contains("std()"))

### replace activity numbers with descriptive names
data$Activity <- factor(data$Activity, labels = activity_labels[,2])

### Make descriptive variable names by using make.names function
colnames(data)<-make.names(colnames(data))

### create a tidy data set with avg of each var for activity and subject
humanActivity <- data %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

### write to text file
write.table(humanActivity,file="humanactivity.txt",row.names=FALSE)

