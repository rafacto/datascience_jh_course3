# run_analysis.R

This script gets data about human activities collected by accelerometers of a Samsung Galaxy S smartphone and applies a serie of transformations to collect, work with, and clean it.

1. The dataset is downloaded through the provided link and unziped;
2. The downloaded dataset is separated into train and test datasets. This script join them in one;
3. Then, as required, only the variables related to mean and std are selected;
4. The activity labels are located in a separated file. Here they are converted from numbers to names and added to the main dataset;
5. The variables names are located in a separated file. Here they are set as the column names of the main dataset;
6. The subjects are located in a separated files (train and test). Here they are downloaded, joined, and added to the main dataset;
7. Tidy data is obtained grouping main dataset by activity and subjects and summarizing by mean using group_by and summarise_all dplyr function;
