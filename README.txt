This data comes from:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

More information, including the original dataset, can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset referenced above was downloaded and read into R.  The following transformations were then applied:

Each test and train file were read in, along the the subject files, activity lables, and features files.  

The features file was converted using as.character()

One "test" data frame was created by cbind of the stest, xtest, and ytest dataframes.  The same was done for "train".

A "data" dataframe was created by rbind of the above mentioned "train" and "test" DFs.

Names() was used to name each column a descriptive name, using the "feature" file

Duplicated column names were removed

Only columns containing "mean()" and "std()" were selected, along with Subject and Activity

The activity_labels file was used to replace the activity numbers with descriptive names.  This was done by converting Activity to a factor and assigning appropriate labels.

The make.names() functionwas used to remove the "()" from the variable names and make them more readable

The data dataframe was grouped by Subject and Activity and then the mean of each column was taken.

The dataframe was written out to a text file named "humanactivity.txt"

