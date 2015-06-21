# Cleaning_UCI_Data
The [run_analysis.R] script will take the data from the UCI HAR dataset 
from your current working directory. The labels for the measures and activity 
label lookup are loaded first. Then the test data is loaded with the subject and activity IDs, and the measures 
as the column names. The activitiy labels are merged with the dataset. The same process is performed on 
the train data set. Then the two datasets are row bound together to for the complete dataset. 
This is subset for the mean and standard deviation measures only. Then each observation is melted 
into key value pairs for each measure of each subject's activity. These pairs are then summarised 
into a wide tidy set using the mean for each measure.

[run_analysis.R]: ../master/run_analysis.R
