## Overview
Filtered and grouped average data for mean and standard deviation data from the Human Activity Recognition database.

## Data Source

The data is sourced from the Human Activity Recognition database.  See:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Raw dataset located here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Data Set Characteristics:  
  * Type: Multivariate, Time-Series
  * Number of Instances:  10299
  * Number of Attributes:  561


## Data Transformation and output

Data transformation is executed by the run_analysis.R script.  The script:

1.  Merges the training and the test sets to create an intermediate data set.  The source of the data is added.
1.  Extracts only the measurements on the mean and standard deviation for each measurement.  These measurements match the naming pattern "-mean" and "-std".  The result of this extraction is the dataset **filteredDF**.
1.  Uses descriptive activity names to name the activities in the data set, from the data source's activity_labels.txt file.
1.  Appropriately labels the data set with descriptive variable names.  The labels are retained from the data source's features.txt file.
1.  Creates a second, independent tidy data set **summaryDF** with the average of each variable for each activity and each subject.

## filteredDF 
Tidy data, labeled per the table below, with one row per measurement set.

### Data frame parameters
|Column | Label | Description | Data Format |
|-------|-------|-------------|-------------|
|[1]| tBodyAcc-mean()-X| **Human Activity Recognition Database data.**| Refer to the raw data files readme.txt and features_info.txt files for parameter descriptions and data format. |         
|[2]| tBodyAcc-mean()-Y | |
|[3]| tBodyAcc-mean()-Z ||
|[4]| tBodyAcc-std()-X ||              
|[5]| tBodyAcc-std()-Y || ||              
|[6]| tBodyAcc-std()-Z || ||              
|[7]| tGravityAcc-mean()-X ||          
|[8]| tGravityAcc-mean()-Y || ||         
|[9]| tGravityAcc-mean()-Z ||           
|[10]| tGravityAcc-std()-X ||            
|[11]| tGravityAcc-std()-Y ||            
|[12]| tGravityAcc-std()-Z ||            
|[13]| tBodyAccJerk-mean()-X ||          
|[14]| tBodyAccJerk-mean()-Y ||          
|[15]| tBodyAccJerk-mean()-Z ||          
|[16]| tBodyAccJerk-std()-X ||           
|[17]| tBodyAccJerk-std()-Y ||           
|[18]| tBodyAccJerk-std()-Z ||           
|[19]| tBodyGyro-mean()-X ||             
|[20]| tBodyGyro-mean()-Y ||             
|[21]| tBodyGyro-mean()-Z ||             
|[22]| tBodyGyro-std()-X ||              
|[23]| tBodyGyro-std()-Y ||              
|[24]| tBodyGyro-std()-Z ||              
|[25]| tBodyGyroJerk-mean()-X ||         
|[26]| tBodyGyroJerk-mean()-Y ||         
|[27]| tBodyGyroJerk-mean()-Z ||         
|[28]| tBodyGyroJerk-std()-X ||          
|[29]| tBodyGyroJerk-std()-Y ||          
|[30]| tBodyGyroJerk-std()-Z ||          
|[31]| tBodyAccMag-mean() ||            
|[32]| tBodyAccMag-std() ||              
|[33]| tGravityAccMag-mean() ||         
|[34]| tGravityAccMag-std() ||           
|[35]| tBodyAccJerkMag-mean() ||         
|[36]| tBodyAccJerkMag-std() ||          
|[37]| tBodyGyroMag-mean() ||            
|[38]| tBodyGyroMag-std() ||             
|[39]| tBodyGyroJerkMag-mean() ||        
|[40]| tBodyGyroJerkMag-std() ||         
|[41]| fBodyAcc-mean()-X ||              
|[42]| fBodyAcc-mean()-Y ||              
|[43]| fBodyAcc-mean()-Z ||              
|[44]| fBodyAcc-std()-X ||               
|[45]| fBodyAcc-std()-Y ||               
|[46]| fBodyAcc-std()-Z ||               
|[47]| fBodyAcc-meanFreq()-X ||          
|[48]| fBodyAcc-meanFreq()-Y ||          
|[49]| fBodyAcc-meanFreq()-Z ||          
|[50]| fBodyAccJerk-mean()-X ||          
|[51]| fBodyAccJerk-mean()-Y ||          
|[52]| fBodyAccJerk-mean()-Z ||          
|[53]| fBodyAccJerk-std()-X ||           
|[54]| fBodyAccJerk-std()-Y ||           
|[55]| fBodyAccJerk-std()-Z ||           
|[56]| fBodyAccJerk-meanFreq()-X ||      
|[57]| fBodyAccJerk-meanFreq()-Y ||      
|[58]| fBodyAccJerk-meanFreq()-Z ||      
|[59]| fBodyGyro-mean()-X ||             
|[60]| fBodyGyro-mean()-Y ||             
|[61]| fBodyGyro-mean()-Z ||             
|[62]| fBodyGyro-std()-X ||              
|[63]| fBodyGyro-std()-Y ||              
|[64]| fBodyGyro-std()-Z ||              
|[65]| fBodyGyro-meanFreq()-X ||         
|[66]| fBodyGyro-meanFreq()-Y ||         
|[67]| fBodyGyro-meanFreq()-Z ||         
|[68]| fBodyAccMag-mean() ||             
|[69]| fBodyAccMag-std() ||              
|[70]| fBodyAccMag-meanFreq() ||         
|[71]| fBodyBodyAccJerkMag-mean() ||     
|[72]| fBodyBodyAccJerkMag-std() ||      
|[73]| fBodyBodyAccJerkMag-meanFreq() || 
|[74]| fBodyBodyGyroMag-mean() ||        
|[75]| fBodyBodyGyroMag-std() ||         
|[76]| fBodyBodyGyroMag-meanFreq() ||    
|[77]| fBodyBodyGyroJerkMag-mean() ||    
|[78]| fBodyBodyGyroJerkMag-std() ||     
|[79]| fBodyBodyGyroJerkMag-meanFreq() ||
|[80]| subject | subject parameter from Human Activity Recognition Database data.  Integer data, but other formats are supported. | integer: dataset dependent, source dataset has subjects 1-20, complete. |                    
|[81]| activity | subject activity from Human Activity Recognition Database data.  Factorized based on source dataset's activity_labels.txt file.| factor: dataset dependent, source dataset has activities 1-6, complete.  1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING  |
|[82]| source | original data source | character: train or test | 

                 
## summaryDF 
Tidy data, labeled per the table below, with one row per summary grouping set.

### data frame parameters
|Column | Label | Description | Data Format |
|-------|-------|-------------|-------------|
|[1]| Subject | subject parameter from Human Activity Recognition Database data.  Integer data, but other formats are supported. | integer: dataset dependent, source dataset has subjects 1-20, complete. |      
|[2]| Activity | subject activity from Human Activity Recognition Database data.  Factorized based on source dataset's activity_labels.txt file.| factor: dataset dependent, source dataset has activities 1-6, complete.  1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING  |                    
|[3]| tBodyAcc-mean()-X |  **Human Activity Recognition Database data.**| Refer to the raw data files readme.txt and features_info.txt files for parameter descriptions and data format. |     
|[4]| tBodyAcc-mean()-Y ||        
|[5]| tBodyAcc-mean()-Z ||              
|[6]| tBodyAcc-std()-X ||               
|[7]| tBodyAcc-std()-Y ||               
|[8]| tBodyAcc-std()-Z ||               
|[9]| tGravityAcc-mean()-X ||           
|[10]| tGravityAcc-mean()-Y ||           
|[11]| tGravityAcc-mean()-Z ||           
|[12]| tGravityAcc-std()-X ||            
|[13]| tGravityAcc-std()-Y ||            
|[14]| tGravityAcc-std()-Z ||            
|[15]| tBodyAccJerk-mean()-X ||          
|[16]| tBodyAccJerk-mean()-Y ||          
|[17]| tBodyAccJerk-mean()-Z ||          
|[18]| tBodyAccJerk-std()-X ||           
|[19]| tBodyAccJerk-std()-Y ||           
|[20]| tBodyAccJerk-std()-Z ||           
|[21]| tBodyGyro-mean()-X ||             
|[22]| tBodyGyro-mean()-Y ||             
|[23]| tBodyGyro-mean()-Z ||             
|[24]| tBodyGyro-std()-X ||              
|[25]| tBodyGyro-std()-Y ||              
|[26]| tBodyGyro-std()-Z ||              
|[27]| tBodyGyroJerk-mean()-X ||         
|[28]| tBodyGyroJerk-mean()-Y ||         
|[29]| tBodyGyroJerk-mean()-Z ||         
|[30]| tBodyGyroJerk-std()-X ||          
|[31]| tBodyGyroJerk-std()-Y ||          
|[32]| tBodyGyroJerk-std()-Z ||          
|[33]| tBodyAccMag-mean() ||            
|[34]| tBodyAccMag-std() ||              
|[35]| tGravityAccMag-mean() ||          
|[36]| tGravityAccMag-std() ||           
|[37]| tBodyAccJerkMag-mean() ||         
|[38]| tBodyAccJerkMag-std() ||          
|[39]| tBodyGyroMag-mean() ||            
|[40]| tBodyGyroMag-std() ||             
|[41]| tBodyGyroJerkMag-mean() ||        
|[42]| tBodyGyroJerkMag-std() ||         
|[43]| fBodyAcc-mean()-X ||              
|[44]| fBodyAcc-mean()-Y ||              
|[45]| fBodyAcc-mean()-Z ||              
|[46]| fBodyAcc-std()-X ||               
|[47]| fBodyAcc-std()-Y ||               
|[48]| fBodyAcc-std()-Z ||               
|[49]| fBodyAcc-meanFreq()-X ||          
|[50]| fBodyAcc-meanFreq()-Y ||          
|[51]| fBodyAcc-meanFreq()-Z ||          
|[52]| fBodyAccJerk-mean()-X ||          
|[53]| fBodyAccJerk-mean()-Y ||          
|[54]| fBodyAccJerk-mean()-Z ||          
|[55]| fBodyAccJerk-std()-X ||           
|[56]| fBodyAccJerk-std()-Y ||           
|[57]| fBodyAccJerk-std()-Z ||           
|[58]| fBodyAccJerk-meanFreq()-X ||      
|[59]| fBodyAccJerk-meanFreq()-Y ||      
|[60]| fBodyAccJerk-meanFreq()-Z ||      
|[61]| fBodyGyro-mean()-X ||             
|[62]| fBodyGyro-mean()-Y ||             
|[63]| fBodyGyro-mean()-Z ||             
|[64]| fBodyGyro-std()-X ||              
|[65]| fBodyGyro-std()-Y ||              
|[66]| fBodyGyro-std()-Z ||              
|[67]| fBodyGyro-meanFreq()-X ||         
|[68]| fBodyGyro-meanFreq()-Y ||         
|[69]| fBodyGyro-meanFreq()-Z ||         
|[70]| fBodyAccMag-mean() ||             
|[71]| fBodyAccMag-std() ||              
|[72]| fBodyAccMag-meanFreq() ||         
|[73]| fBodyBodyAccJerkMag-mean() ||     
|[74]| fBodyBodyAccJerkMag-std() ||      
|[75]| fBodyBodyAccJerkMag-meanFreq() ||
|[76]| fBodyBodyGyroMag-mean() ||        
|[77]| fBodyBodyGyroMag-std() ||         
|[78]| fBodyBodyGyroMag-meanFreq() ||    
|[79]| fBodyBodyGyroJerkMag-mean() ||    
|[80]| fBodyBodyGyroJerkMag-std() ||     
|[81]| fBodyBodyGyroJerkMag-meanFreq() ||
                 
 