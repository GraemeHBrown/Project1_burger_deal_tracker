-- SELECT * FROM burgers WHERE eatery_id = 3;

-- SELECT deals.* FROM deals INNER JOIN burgers ON burgers.id = deals.burger_id WHERE burgers.eatery_id = 259;

SELECT * FROM burgers WHERE id = 445;

SELECT DISTINCT deal_name a, burger_id b FROM deals ORDER BY deals.burger_id;
