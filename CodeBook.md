## What this Code Book about?

This code book explains the variable used in the run_analysis.R script.

## Description of the raw data

run_analysis.R script assumes the dataset is in the working directory. 

In the working directory, it contains 

- features.txt

All features of an activity. Column names will be extracted from this file.

- features_info.txt

It gives descriptive explanation of features.

- activity_labes.txt

It gives the coding of activities

- train folder 

It contains X_train.txt, y_train.txt, subject_train.

- test folder 

It contains X_test.txt, y_test.txt, subject_test.

## Working flow of the solution to this project

1. "features" (variable) was extracted from features.txt by readLines, then the number and the space at the beginning were removed.

2. make train and test data frames. Since features dataset, activity dataset and subject dataset are in 3 text files, they are first read into temp variables and then combined to make data frames for train and test: activity_train and activity_test.

3. use rbind to combine train and test data frames to make one data frame: activity

4. extract and cleaning the "activity_labels" from activity_labels.txt.

5. label the activity column in the activity data frame with "actvity_labels".

6. make 2 filters: one with "mean" filter and the other with "std" filter

7. extract from activity data frame all the features related to meean and std

8. use dplyr package to make a pipeline to group the activity by activity and subject and apply mean to each.

9. generate the new dataset into a text file.
