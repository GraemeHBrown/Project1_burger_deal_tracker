-- SELECT * FROM burgers WHERE eatery_id = 3;

-- SELECT deals.* FROM deals INNER JOIN burgers ON burgers.id = deals.burger_id WHERE burgers.eatery_id = 259;

-- SELECT * FROM burgers WHERE id = 445;


-- SELECT burger_id, deal_name FROM deals WHERE deal_name IN (SELECT distinct deal_name FROM deals);


WITH theResultSet AS
(
    SELECT DISTINCT(deal_name) AS name FROM deals
)
SELECT DISTINCT burger_id
  FROM deals AS a
  JOIN theResultSet as b ON a.deal_name = b.name;
