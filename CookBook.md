## Code Book

The data used in this project is described below.

### Files Used to Create Final Tidy Data

* `features.txt`: Names of the 561 features.
* `activity_labels.txt`: Names and IDs for each of the 6 activities.
* `X_train.txt`: 7352 observations of the 561 features, for 21 of the 30 volunteers.
* `subject_train.txt`: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in `X_train.txt`.
* `y_train.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.
* `X_test.txt`: 2947 observations of the 561 features, for 9 of the 30 volunteers.
* `subject_test.txt`: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in `X_test.txt`.
* `y_test.txt`: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in `X_test.txt`.

### Processing steps

1. All of the relevant data was read into data frames, appropriate column headers were added, and the training and test sets were combined into a single data set.
2. All columns except for mean and std columns were removed.
3. The activity column was converted to factors.
4. A tidy data set was created containing the mean of each feature for each observation and each activity.