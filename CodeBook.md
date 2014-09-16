---
title: "CodeBook.md"
author: "Bodil Biering"
date: "8 Sep 2014"
output: html_document
---

- The feature names are read from features.txt
- The activity labels are read from activity_labels.txt, 
  each row has an activity number and an activity label
- The subject, activity and testdata from the test dataset are combined to one dataframe
  with cbind, and the columns are named with the raw feature names.
- Same procedure for the train dataset.
- Now the test and train dataframes are combined to one dataframe and stored in 'res', 
  each row in 'res' has a subject nr an acivity nr and 561 feature observations.
- The columns with feature names containing any of the words "Mean, mean, Std, std" are 
  extracted and the result is stored in 'res2' toghether with subject and activity nr,
  so each row in 'res2' contains a subject nr an acivity nr and 86 feature observations.
- The activity numbers in 'res2' are substituted by the descriptive activity labels.
- All the featurenames in 'res2' are cleaned up, i.e., all lowercase, no dots or parenthesis.
- 'res2' is now grouped by subject and then activity, and the mean is calculated for each feature
  in each group. The result is stored in 'tidymean'.

