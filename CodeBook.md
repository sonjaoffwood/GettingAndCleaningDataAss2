# CodeBook
### Original Data
The original data, together with the codebook and readme file can be downloaded at the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Additional accompanying information explaining the original data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### Tidy Data
#### Transformation
The tidy data is created by the following transformation 
* Combines the subject identifier, predictor values and activity into one data set.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Changes the activity name to one of the following 'Walking', 'Walking Upstairs', 'Walking Downstairs', 'Sitting', 'Standing' or 'Laying'.
* Calculates the mean for each measurement variable for each activity and each subject.

#### Final Data
The final data is the following file:
* 'finaldata.txt': Contains a 180x68 data set were each row represents the averages for every measurement variable for a unique subject and activity combination.

The data in the file has
* 30 subjects (with unique identifier),
* 6 activities, as names above, and
* Each of the measurement variables is either the mean (mean()) or the standard deviation (std()) of one of the below - the measurements indicated with an XYZ will be in one of 3 dimensions, i.e. in the X, Y or Z dimension:
 * tBodyAcc-XYZ
 * tGravityAcc-XYZ
 * tBodyAccJerk-XYZ
 * tBodyGyro-XYZ
 * tBodyGyroJerk-XYZ
 * tBodyAccMag
 * tGravityAccMag
 * tBodyAccJerkMag
 * tBodyGyroMag
 * tBodyGyroJerkMag
 * fBodyAcc-XYZ
 * fBodyAccJerk-XYZ
 * fBodyGyro-XYZ
 * fBodyAccMag
 * fBodyAccJerkMag
 * fBodyGyroMag
 * fBodyGyroJerkMag
