##Readme for script run_analysis.R

### Reading in the datasets
The run_analysis.R script assumes that the data is downloaded into the working directory of the user. It assumes the data is in an unzipped folder called **"UCI HAR Dataset"**.

The script assumes that the following libraries are installed (the script will load these packages):
* plyr
* reshape2

The script starts off by reading in the provided training dataset, training data activity codes and training data subject codes into separate datasets, and combines them into one. It then reads in the provided testing dataset, testing data activity codes and testing data subject codes into separate datasets, and combines them into one. It ultimately merges the train and test data sets into one and stores it in the dataframe 'total'.

The script performs the following transformation on 'total' in the given order:
* pulls out only the columns representing means or standard deviations of the data,
* renames the activities to one of the following 'Walking',  'Walking Upstairs', 'Walking Downstairs', 'Sitting', 'Standing' or 'Laying',
* transforms the column names by changing each 'mean()' to 'mean', and 'std()' to 'std', and removes the numbering in the column names
* using the melt function, transforms the data into longform data with subject and activity being the IDs, and ultimately
* retransforms the data into wideform data using the dcast function.

The final data is written to a text file in the original 
