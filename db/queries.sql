-- SELECT * FROM burgers WHERE eatery_id = 3;

SELECT deals.* FROM deals INNER JOIN burgers ON burgers.id = deals.burger_id WHERE burgers.eatery_id = 259;
