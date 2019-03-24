# Cleaning Data Course Project
For the script to work, set the working directory to the base of the extracted data folder. 

## Table Loading
For each data table pair (test and train), we first load them into R

## Manipulating the Data
After we load each data table pair (test and train), we use rbind to make them a single data set.
After the data pairs are combined, we add descriptive headers. In the case of the "X" tables, headers were provided but needed to 
first be modified to remove punctuation to make them clear.
The activity table had a column added with a clear description of the activity number.

## Combining!
Once each table type has been loaded, rbind'd, and modified with a header and extra data, we use cbind to combine
all of the tables into a single master table.

## Extracting what we want
Next, we use grep to find the columns of means and standard deviation and extract them into a new table along with the user and activity.
This gives us the "interestingdata" table.

## Summarizing
Using our extracted table, we now summarize to get the mean of each column of interest, grouped by the user and activity.
This gives us the "interestingsummary" table
