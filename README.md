## README.md
This file

## CodeBook.md
Description of all variables within the dataset

## run_analysis.R
A monolithic R script for conversion of Human Activity Recognition database from source files and produce the following:
  * filteredDF - a dataframe, containing each value for each measured variable of type "mean" or "std", along with subject, activity, and which dataset was used.
  * summaryDF - a dataframe, containing the average of each measured variable of the type "mean" or "std", grouped by the subject and the activity.

run_analysis.R must be run from witin the Human Activity Recognition database folder, and will look for files within that directory as well as ./train/ and ./test/.

See CodeBook.md for more details.

All intermediate objects are unloaded.

No external packages are required.
