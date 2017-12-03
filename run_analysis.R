# read all data and name columns
subject_train <- read.table(".\\train\\subject_train.txt")
names(subject_train) <- "ID"

subject_test <- read.table(".\\test\\subject_test.txt")
names(subject_test) <- "ID"

# read features and assign to train and test
featureNames <- read.table("features.txt")

X_train <- read.table(".\\train\\X_train.txt")
names(X_train) <- featureNames$V2

X_test <- read.table(".\\test\\X_test.txt")
names(X_test) <- featureNames$V2

y_train <- read.table(".\\train\\y_train.txt")
names(y_train) <- "Activity"

y_test <- read.table(".\\test\\y_test.txt")
names(y_test) <- "Activity"

# combine into single dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)

# Step 1: create combined dataset with train and test
combined <- rbind(train, test)

# Extract mean and standard deviations
requiredcols <- grepl("mean\\(\\)", names(combined)) |   grepl("std\\(\\)", names(combined))
requiredcols[1:2] <- TRUE

# Step 2: keep only ID, Activity and mean and STD columns
combined <- combined[, requiredcols]

# Steps 3 & 4: Assign activity names
activityNames <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
combined$Activity <- factor(combined$Activity, labels = activityNames)

# Step 5: create the tidy data set
library(reshape2)
molten <- melt(combined, id=c("ID","Activity"))
tidied <- dcast(molten, ID + Activity ~ variable, mean)
write.csv(tidied, "final_tidied.csv", row.names=FALSE)