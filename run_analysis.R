# run_analysis.r  - See README.md for more information

cat("Running run_analysis.R.\n")

# Load environment

# Set up workspace

# uncomment and adjust as required.
# setwd("~/Documents/Downloads/UCI HAR Dataset")


# Load activity labels and data features

activityDF <- read.table("activity_labels.txt", 
						sep = " ", 
						col.name = c("index","activity"),
						stringsAsFactors = FALSE)

featuresDF <- read.table("features.txt", 
						sep = " ", 
						col.name = c("index","feature"),
						stringsAsFactors = FALSE)


# Load "training" data

setwd("train")

cat("Loading training data.  Please wait.\n")

subject_trainDF <- read.table("subject_train.txt", col.name = "subject")
x_trainDF <- read.table("X_train.txt")
y_trainDF <- read.table("Y_train.txt", col.name = "activity")

# Reform training data into tidy data frame, based on x

# Add subjects as a new numeric column

x_trainDF$subject <- subject_trainDF$subject

# Add activity as a new column

x_trainDF$activity <- y_trainDF$activity

# Add a column indicating which dataset this is from

x_trainDF$source <- "train"

# remove data frames no longer required
rm(subject_trainDF)
rm(y_trainDF)


# Load "test" data

setwd("../test")


cat("Loading test data. Please wait.\n")

subject_testDF <- read.table("subject_test.txt", col.name = "subject")
x_testDF <- read.table("X_test.txt")
y_testDF <- read.table("Y_test.txt", col.name = "activity")

# Reform test data into tidy data frame, based on x

# Add subjects as a new numeric column

x_testDF$subject <- subject_testDF$subject

# Add activity as a new column

x_testDF$activity <- y_testDF$activity

# Add a column indicating which dataset this is from

x_testDF$source <- "test"

# remove data frames no longer required
rm(subject_testDF)
rm(y_testDF)

# Return on the main working directory

setwd("..")

cat("Merging datasets.\n")

# Merge training and test dataframes, training first.

completeDF <- rbind(x_trainDF, x_testDF)

# remove data frames no longer required
rm(x_trainDF)
rm(x_testDF)


# Tidy and compact complete dataframe

# Replace column names with measurements (feature, from features dataframe)

colnames(completeDF) <- c(featuresDF$feature, "subject", "activity")

# Remove columns that don't match this pattern, using GREP
  # -mean
  # -std
  # subject
  # activity
  # source

cat("Filtering resultant dataset.\n")
  
filteredDF <- completeDF[, grep("-mean|-std|subject|activity|source", colnames(completeDF))]

# remove data frames no longer required
rm(completeDF)
rm(featuresDF)

# convert activity column from a numeric to an integer to a factor based on activityDF

filteredDF$activity <- as.integer(filteredDF$activity)

filteredDF$activity <- factor(filteredDF$activity, 
								levels = activityDF$index, 
								labels = activityDF$activity)

# remove data frames no longer required
rm(activityDF)

# create a new data frame with the average reading for each subject, for each activity
# for all activities (where activity column labels include -mean and -std)

cat("Creating summary dataset.\n")

summaryDF <- aggregate(filteredDF[grep("-mean|-std", colnames(filteredDF))], 
						list(Subject = filteredDF$subject, Activity = filteredDF$activity), 
						FUN="mean")


# filteredDF and summaryDF are left in the user environment.

cat("Complete.\n")

# complete