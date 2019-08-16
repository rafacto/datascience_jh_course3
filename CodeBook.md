# CodeBook - run_analysis.R

## Data (file names)
* traindata: training set;
* trainlabels: training set activity labels;
* testdata: testing set;
* testlabels: testing set activity labels;
* varnames: features names (dataset column names);
* activitynames: activity labels' names;
* trainsubjects: training subjects;
* testsubjects: testing subjects.

## Variables
* data: dataset formed by the joining of traindata and testdata;
* labels: labels set formed by the joining of trainlabels ans testlabels;
* meanstdindxs: indexes of the columns correspondent to mean and standard deviation variables;
* meanstddata: main dataset containing mean and standard deviation variables;
* getactname: function that translates activity labels from number to names;
* labelnames: list of all activity labels names;
* meanstddata: main dataset updated with activity labels column;
* meanstdvarnames: features names (dataset column names) of mean and standard deviation variables;
* subjects: subjects set formed by the joining of trainsubjects and testsubjects;
* meanstddata: main dataset updated with subjects column;
* tidydata: data set with the average of each variable of the main dataset for each activity and each subject.

## Transformations
* Training and testing datasets are joined into a single dataset called data;
* Only the variables mean and std variables were selected into variable meanstddata;
* Activity lables were read from a separated file, converted from numbers to names, and added to meanstddata;
* Variable names were read from a separated file and added as the column names of meanstddata;
* Subjects were read from separated files and joined into variable subjects, which was added to meanstddata;
* tidydata was generated grouping meanstddata by activity and subjects and summarized by the mean.