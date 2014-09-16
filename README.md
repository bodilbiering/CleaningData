CleaningData
============

Repository for programming assignment in the course 'Getting and Cleaning Data'.
The repository contains a script "run_analysis.R", that creates a tidy dataset
and a codebook "CodeBook.md" describing transformations made to the data by this script.
The script requires installation of the dplyr package.
The script will download datafiles and place them in a directory ./data.
Furthermore, the repository contains the resulting tidy dataset as a text file, "tidy.txt"
created with: write.table(tidymean, file = "tidytext.txt", row.names = FALSE).
