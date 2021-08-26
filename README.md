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
* [Team Members](#team-members)

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
* [Kaggle Database](https://www.kaggle.com/c/petfinder-adoption-prediction/data)
* [Dog Breed Chart](http://www.dogbreedchart.com/#:~:text=Dog%20Breed%20Chart%20%20%20%20Name%20,%20%201%20%2033%20more%20rows%20)
 
 ### Step 2: Transform ###
 **Pet Finder Cleaning**
 
 <img width="1403" alt="pet_finder_clean" src="https://user-images.githubusercontent.com/53684246/130917374-05212b4f-d604-4a5d-b391-b42a53bc2fed.png">
 * Brief Explanation

<img width="661" alt="weight_clean" src="https://user-images.githubusercontent.com/53684246/130917673-fdb6820b-b5c1-4876-9a26-72dbb69d7d17.png">
  * Brief Explanation
  
 ### Step 3: Load ### 
 * Once the data frames were all properly formatted, cleaned and tranformed, the `.csv files` were loaded into a PostgreSQL database named `pets_db` via Jupyter Notebook 
 
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
 
 ## ERD Diagram ##
 ![ERD v4](https://user-images.githubusercontent.com/53684246/130913756-a179c414-e881-4622-8353-b532bcd63412.PNG)
 
 ## Data Visualization ##
 <img width="515" alt="weight_plot" src="https://user-images.githubusercontent.com/53684246/130971205-e4759241-ba91-4e92-99f1-756b100f8516.png">
 
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

#### Team Members #### 
* Melissa Diep
* Rosali Gonzalez
* Donett Rowe
* Joshua Pohl
* Carlyse Thomas
