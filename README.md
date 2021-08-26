# Adoption and Breed Data for Prospective Dog Owners

## Team Name: The Woof Team 

## Project Description/Outline:

Our goal is to find the number of dogs that are able to be adopted in New Jersey, and combine it with characterics of each breed, so that prospective dog owners can make an informed decision on which dog to adopt.

## Table of Contents ## 
* [ETL Process](#etl-process)
  * [Step 1: Extract](#step-1-extract)
    * [Data Sources](#data-sources)
  * [Step 2: Transform](#step-2-transform)
  * [Step 3: Load](#step-3-load)
* [Shcema](#schema)
* [Setup](#setup)
* [Sample Queries](#sample-queries)
* [Status](#status)
* [Contacts](#contacts)

## ETL Process ## 
### Step 1: Extract ### 

**Wrecks and Obstructions Extraction**
* Downloaded AWOIS Obstructions and AWOIS Wrecks `.xlsx files` from the [Wrecks and Obstructions Database](https://nauticalcharts.noaa.gov/data/wrecks-and-obstructions.html) 
* Converted the respective files to a `.csv file` on local machine 
* Read the `.csv file` into Jupyter Notebook for cleaning and transformation 
