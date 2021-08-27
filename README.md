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
* [Schema](#schema)
* [Setup](#setup)
* [Sample Queries](#sample-queries)
* [Process Pain-Points](#process-pain-points)
* [Team Members](#team-members)



## ETL Process ## 
### Step 1: Extract ### 

**Pet Finder Data Extraction** - for Dog Breeds and Dog List Data
*  Downloaded pip install petpy per the instructions on https://petpy.readthedocs.io/en/latest/ . Petpy is an unofficial Pythonwrapper of the Petfinder API (https://www.petfinder.com/developers/v2/docs/) for interacting with Petfinder’s database of animals and animal welfare organizations.
*  Created a Jupyter Notebook to interact with petpy.
*  Created api key and secret key per documentation, and pre-filtered to only return adoptable dogs 20 miles from Westfield, NJ (07090) 

 ```

df_dogs = pf.animals(location = '07090', distance = '20', animal_type= 'dog', status = 'adoptable', sort = 'distance', after_date = '2021-01-01', results_per_page=50, pages=16, return_df=True)
 ```

*  Outputted pandas dataframe for cleaning and transformation into CSV file


**Weight Data Extraction**

*  Copied weight range for different dog breeds from [American Kennel Club](https://www.akc.org/expert-advice/nutrition/breed-weight-chart/#:~:text=Breed%20Weight%20Chart%20%20%20%)
*  Pasted the data into CSV for cleaning and transformation

**LifeSpan Data Extraction**

*  Copied average lifespan data for different dog breeds from [PetCareRx](https://www.petcarerx.com/article/lifespan-of-a-dog-a-dog-years-chart-by-breed/1223?utm_source=linkshare&utm_medium=affiliate&utm_campaign=deeplink&utm_content=msYS1Nvjv4c&id=1944&subid=msYS1Nvjv4c&siteID=msYS1Nvjv4c-w4EN7Lh3WF08OHca3.4Hlg&ranMID=38368&ranEAID=msYS1Nvjv4c&ranSiteID=msYS1Nvjv4c-w4EN7Lh3WF08OHca3.4Hlg)
*  Pasted the data into CSV for cleaning and transformation

**Breeds Characteristics Extraction**

*
 
#### Data Sources #### 
* [PetCareRx](https://www.petcarerx.com/article/lifespan-of-a-dog-a-dog-years-chart-by-breed/1223?utm_source=linkshare&utm_medium=affiliate&utm_campaign=deeplink&utm_content=msYS1Nvjv4c&id=1944&subid=msYS1Nvjv4c&siteID=msYS1Nvjv4c-w4EN7Lh3WF08OHca3.4Hlg&ranMID=38368&ranEAID=msYS1Nvjv4c&ranSiteID=msYS1Nvjv4c-w4EN7Lh3WF08OHca3.4Hlg)
* [PetFinder](https://www.petfinder.com/developers/)
* [American Kennel Club](https://www.akc.org/expert-advice/nutrition/breed-weight-chart/#:~:text=Breed%20Weight%20Chart%20%20%20%)
* [Kaggle Database](https://www.kaggle.com/c/petfinder-adoption-prediction/data)
* [Dog Breed Chart](http://www.dogbreedchart.com/#:~:text=Dog%20Breed%20Chart%20%20%20%20Name%20,%20%201%20%2033%20more%20rows%20)
 
 ### Step 2: Transform ###
 **Pet Finder Cleaning**
  ##### ERD Diagram ##
* Before we started to transform the data, we designed an ERD utilizing https://www.quickdatabasediagrams.com/ to outline the fields from each data source that we wanted to rename or keep, and identified the primary key (unique identifier) for each set of data. 
* We did this in preparation for creating a SQL database and joining the data.
 
 ![ERD v5](https://github.com/melissadiep94/dog_breeds_project/blob/main/Images/ERD%20v5.PNG?raw=true)
 
 
 <img width="1403" alt="pet_finder_clean" src="https://user-images.githubusercontent.com/53684246/130917374-05212b4f-d604-4a5d-b391-b42a53bc2fed.png">

<img width="661" alt="weight_clean" src="https://user-images.githubusercontent.com/53684246/130917673-fdb6820b-b5c1-4876-9a26-72dbb69d7d17.png">
  * Brief Explanation


* Breed ID: Identifying indicator used to match each dog breed during the transformation and load processes
* Breed Name: Name of dog breed
* Average Lifespan Years: Average amount of years that a particular breed is expected to live

 ### Step 3: Load ### 
 * Once the data frames were all properly formatted, cleaned and tranformed, the `.csv files` were loaded into a PostgreSQL database named `TheWoofTeam` via Jupyter Notebook, using the following dependencies and connection route to connect to the local database.
 
 <img width="700" alt="Jupyter Notebook SQL Load Example" src="https://github.com/melissadiep94/dog_breeds_project/blob/Carlyse/Images/Screen%20Shot%202021-08-26%20at%208.23.44%20PM.png">
 
 Below are the steps to complete Jupyter Notebook Load:
   * The CSV files were loaded into Jupyter Notebook using the `read_csv` method
   * CSV files were then cleaned (using drop column and/or renaming method) and then placed into a dataframe format
   * The newly created or trimmed dataframes were then loaded into the database using the `to_sql` method (as follows) 
     <img width="550" alt="to sql method" src="https://github.com/melissadiep94/dog_breeds_project/blob/Carlyse/Images/Screen%20Shot%202021-08-26%20at%208.38.35%20PM.png">
   * After database upload, queries on all tables were performed to confirm that all dataframes were loaded correctly (as follows)
     <img width="550" alt="dataframe extraction" src="https://github.com/melissadiep94/dog_breeds_project/blob/Carlyse/Images/Screen%20Shot%202021-08-26%20at%208.42.44%20PM.png">
 
 [Click to Review Code - TheWoofTeam.ipynb](https://github.com/melissadiep94/dog_breeds_project/blob/main/TheWoofTeam.ipynb)
 
 ## Schema ##
 ```
 CREATE TABLE Breeds (
  breed_id INT,
  breed_type VARCHAR(100),
  breed_name VARCHAR(100),
  PRIMARY KEY (breed_id)
);
CREATE TABLE Lifespan (
  breed_id INT,
  breed_name VARCHAR(100),
  avg_lifespan_years VARCHAR(100),
  FOREIGN KEY (breed_id) REFERENCES Breeds(breed_id)
);
CREATE TABLE Weight (
  breed_id INT,
  breed_name VARCHAR(100),
  breed_female VARCHAR(100),
  weight_male VARCHAR(100),
  FOREIGN KEY (breed_id) REFERENCES Breeds(breed_id)
);
CREATE TABLE Pet_Finder (
  dog_id INT,
  dog_name VARCHAR(100),
  breed_id INT,
  breed_name VARCHAR(100),
  age VARCHAR(100),
  color VARCHAR(100),
  coat_type VARCHAR(100),
  adoption_status VARCHAR(100),
  kid_freindly FLOAT,
  dog_freindly FLOAT,
  house_trained FLOAT,
  special_needs FLOAT,
  distance INT,
  location VARCHAR(100),
  FOREIGN KEY (breed_id) REFERENCES Breeds(breed_id)
);
CREATE TABLE Breed_Characteristics (
  breed_id INT,
  breed_name VARCHAR(100),
  Size INT,
  kid_freindly FLOAT,
  dog_freindly FLOAT,
  low_shedding FLOAT,
  easy_to_groom FLOAT,
  good_health FLOAT,
  low_barking FLOAT,
  easy_to_train FLOAT,
  tolerates_hot FLOAT,
  totlerates_cold FLOAT,
  FOREIGN KEY (breed_id) REFERENCES Breeds(breed_id)
);
```
 

 
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
 
 ## Sample Queries ## 
 ```
 SELECT breeds.breed_id, breeds.breed_name, lifespan.avg_lifespan_years
FROM lifespan
INNER JOIN breeds ON
breeds.breed_id = lifespan.breed_id
 ```
 Which returns
 
<img width="497" alt="data_output_schema" src="https://user-images.githubusercontent.com/53684246/130919912-341025db-1444-40bb-8b82-78c95a350f40.png">
 
 ```
SELECT lifespan.breed_id, lifespan.breed_name, lifespan.avg_lifespan_years
FROM lifespan
WHERE avg_lifespan_years = '10 to 13 yrs'
 ```
 Which returns
 
 <img width="481" alt="lifespan_output_schema" src="https://user-images.githubusercontent.com/53684246/130920869-a6809175-1180-48a4-b602-3d4b906ecea7.png">

#### Process Pain-Points ####
API Process Terminal View
* Petfinder has a secondary way of extracting data via Terminal View. The process is as follows: 
   * Create a Petfinder account
   * Create a Petfinder API Key (or Client ID) and a Secret Key
   * Using cURL tesitng, submit API and Secret Key using API call 
      <img width="100" alt="Terminal View API Call" src="https://github.com/melissadiep94/dog_breeds_project/blob/Carlyse/Images/Screen%20Shot%202021-08-22%20at%201.22.01%20PM.png">
   * Once the token is recieved, submit the folling call to complete the request
      <img width="100" alt="Token Request" src="https://github.com/melissadiep94/dog_breeds_project/blob/Carlyse/Images/Screen%20Shot%202021-08-22%20at%201.23.42%20PM.png">
   * The call will then return a JSON response in terminal
      <img width="100" alt="JSON Respon" src="https://github.com/melissadiep94/dog_breeds_project/blob/Carlyse/Images/Screen%20Shot%202021-08-22%20at%201.26.30%20PM.png">
   * After the JSON response is returned, the response is then sent through Jupyter Notebook
      <img width="100" alt="Jupyter Notebook" src="https://github.com/melissadiep94/dog_breeds_project/blob/Carlyse/Images/Screen%20Shot%202021-08-22%20at%201.29.20%20PM.png">
   * The response from this then saved as a JSON file in Jupyter Notebook
      <img width="100" alt="JSONified Response" src="https://github.com/melissadiep94/dog_breeds_project/blob/Carlyse/Images/Screen%20Shot%202021-08-22%20at%201.35.59%20PM.png">
   * Then saved as a CSV file
      <img width="100" alt="CSV file" src="https://github.com/melissadiep94/dog_breeds_project/blob/Carlyse/Images/Screen%20Shot%202021-08-22%20at%201.37.13%20PM.png">

* The API Terminal View process has many limitations:
   * The API call could not be used and/or transferred into Python/Jupyter Notebook.  Instead the code needed to be added as a variable inorder to be “jsonified” in Jupyter Notebook
   * The API call did not allow for us to set multiple parameters (ie: unable to filter by “dogs” and “state: NJ”).  The call would only recognize the first parameter that was set
   * The API call pulls all pet data for all pet types (cats, dogs, birds, rabbits, etc.)
   * The API call could only do one page at a time; therefore, multiple csv files needed to be created and only 20 pets were listed per page
   * Due to the above limitations, the group decided not to proceed with this method of extraction  
 
CSV File Updates and Revisions
   * Group members had to manually revise and update breed_ID labels for certain CSV files to match the original files' `PRIMARY KEY` from the ERD file
   * Group members tried to sort/filter using other methods such as excel formatting and sorting but the data would get lost or deleted unintentionally

SQL Uploads 
   * During the `pet_finder` database upload, some data cells had phrases with `commas`  
   * SQL does not allow for CSV files to be uploaded with cells that have commas since they are considered as a delimiter 
   * Group members had to research different codes on how to remove commas from a large CSV file so that the data could be loaded properly 


#### Team Members #### 
* Melissa Diep
* Rosali Gonzalez
* Donett Rowe
* Joshua Pohl
* Carlyse Thomas
