

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

truncate table pet_finder, breed_characteristics,weight, lifespan, breeds;

COPY Breeds
FROM 'breeds.csv' 
DELIMITER ',' 
CSV HEADER;

COPY Weight
FROM 'df_breed_weight_clean.csv' 
DELIMITER ',' 
CSV HEADER;

COPY lifespan
FROM 'New_Breed_LifeSpan_Filtered.csv' 
DELIMITER ',' 
CSV HEADER;