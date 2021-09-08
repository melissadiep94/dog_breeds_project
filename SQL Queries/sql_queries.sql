SELECT breeds.breed_id, breeds.breed_name, lifespan.avg_lifespan_years
FROM lifespan
INNER JOIN breeds ON
breeds.breed_id = lifespan.breed_id

SELECT lifespan.breed_id, lifespan.breed_name, lifespan.avg_lifespan_years
FROM lifespan
WHERE avg_lifespan_years = '10 to 13 yrs'

SELECT weight.breed_id, weight.breed_name, weight.weight_male
FROM weight
WHERE weight_male = '40-65 pounds'

SELECT pet_finder.breed_name, lifespan.avg_lifespan_years
FROM lifespan
INNER JOIN pet_finder ON
pet_finder.breed_name = lifespan.breed_name
WHERE avg_lifespan_years = '12 to 15 yrs'