# read features and remove the number and space
features <- readLines("features.txt")
features <- sub("^[0-9]+ ", "", features)

# read the train set and label them with features
X_train <- read.table("train/X_train.txt", col.names = features)

# read the train activity
y_train <- read.table("train/y_train.txt", col.names = "activity")

# read the train subject
subject_train <- read.table("train/subject_train.txt", col.names = "subject")

# combine the features activity and subject together
activity_train <- data.frame(X_train, y_train, subject_train)

# repeat the same thing with test
X_test <- read.table("test/X_test.txt", col.names = features)
y_test <- read.table("test/y_test.txt", col.names = "activity")
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
activity_test <- data.frame(X_test, y_test, subject_test)

# combine the train and the test 
# this solves the questions 1 and 4
activity <- rbind(activity_train, activity_test)

# read the activity labels and remove the number and space
activity_labels <- readLines("activity_labels.txt")
activity_labels <- sub("^[0-9] ", "", activity_labels)

# label the activity with descriptive names
# this solves question 3
activity$activity <- factor(activity$activity, levels = c(1:6),
                            labels = activity_labels)

# find the mean and std features                            
mean_filter <- grepl("[Mm]ean", names(activity))
std_filter <- grepl("[Ss]td", names(activity))
mean_std_filter <- mean_filter | std_filter

# extract the mean and std features from activity data frame
# this solves the question 2
activity_mean_std <- activity[, mean_std_filter]

library(dplyr)

# make a copy of the activity data frame
activity_new <- data.frame(activity)
activity_new$subject <- as.factor(activity_new$subject)

# make a new data frame group by activity and subject
# this solves the questions 5
activity_new_1 <- activity_new %>% group_by(activity, subject) %>% 
     summarise_each((funs(mean)))
dim(activity_new_1)
[1] 180 563
write.csv(activity_new_1, "bysubandactivity.csv")