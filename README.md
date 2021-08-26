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

**Pet Finder Extraction**
* Downloaded the pet_finder `.csv file` from the [Kaggle Database](https://www.kaggle.com/c/petfinder-adoption-prediction/data) 
* Read the `.csv file` into Jupyter Notebook for cleaning and transformation 

**Breeds Extraction**
* 

**Weight Extraction**
*

**LifeSpan Extraction**
*

**Breeds Characteristics Extraction**
*

#### Data Sources #### 
* [PetCareRx](https://www.petcarerx.com/article/lifespan-of-a-dog-a-dog-years-chart-by-breed/1223?utm_source=linkshare&utm_medium=affiliate&utm_campaign=deeplink&utm_content=msYS1Nvjv4c&id=1944&subid=msYS1Nvjv4c&siteID=msYS1Nvjv4c-w4EN7Lh3WF08OHca3.4Hlg&ranMID=38368&ranEAID=msYS1Nvjv4c&ranSiteID=msYS1Nvjv4c-w4EN7Lh3WF08OHca3.4Hlg)
* [PetFinder](https://www.petfinder.com/developers/)
* [American Kennel Club](https://www.akc.org/expert-advice/nutrition/breed-weight-chart/#:~:text=Breed%20Weight%20Chart%20%20%20%)
* [Dog Breed Chart (http://www.dogbreedchart.com/#:~:text=Dog%20Breed%20Chart%20%20%20%20Name%20,%20%201%20%2033%20more%20rows%20)
* [Kaggle Database](https://www.kaggle.com/c/petfinder-adoption-prediction/data)
 
 ### Step 2: Transform ###
 **Pet Finder Cleaning**
 * 
 
 ### Step 3: Load ### 
 * Once the data frames were all properly formatted, cleaned and tranformed, the `.csv files` were loaded into a PostgreSQL database named `pets_db` via Jupyter Notebook 
 
 ## Schema ##
 
 ## ERD Diagram ##
 
 ## Dependencies needed to run the project
 * psycopg2
 * sqlalchemy
 * petpy
 * pandas
 * numpy
 
 ## Setup ## 
 1. Clone the repository to your local drive by: 
     * Clicking on the green "Code" buttom at the top of the page
     * Copying the `SSH` code 
     * Open your terminal and navigate to the directory you want this repository to live in 
       * i.e. `cd Documents/dog_breeds_project/` 
     * Type `git clone` and paste the `SSH` code you copied from the GitHub website into your terminal and hit enter 
 2. You will need to have pgAdmin installed on your machine in order to create and make queries on this database. 

#### Contacts #### 
* Melissa Diep
* Rosali Gonzalez
* Donett Rowe
* Joshua Pohl
* Carlyse Thomas
