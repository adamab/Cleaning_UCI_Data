#Code Book for Output of run_analysis.R

###Variables
The variables in this output are a subset from the UCI HAR dataset. 
They are all of the mean and standard deviation measures from the dataset. 
Please review the [features_info] document from the UCI HAR dataset for more detailed 
information on each measure.

###Data
The data in the output follows the wide tidy format, where each row is a summarised
observation of each subject's activity. Please review the [UCI HAR README] for 
more detailed information on how the data was gathered.

###Transformations
The original dataset has seperate files for training and testing data, subject, feature, and activity labels, 
and detailed observations for each subject's activities. The labels are added to the training and testing data 
seperately. Then the sets are row combined into one complete dataset. This complete dataset is subset to only 
include the measures for mean and standard deviation. This subset is shaped into key value pairs for each observation 
of the subjecct's activities. The key value pairs are then summarised in the wide format using the mean of all 
observations for each of the subject's activities.

[features_info]: ../master/UCI_Files/features_info.txt
[UCI HAR README]: ../master/UCI_Files/README.txt
