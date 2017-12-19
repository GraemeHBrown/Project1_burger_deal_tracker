-- SELECT * FROM burgers WHERE eatery_id = 3;

-- SELECT deals.* FROM deals INNER JOIN burgers ON burgers.id = deals.burger_id WHERE burgers.eatery_id = 259;

-- SELECT * FROM burgers WHERE id = 445;


-- SELECT burger_id, deal_name FROM deals WHERE deal_name IN (SELECT distinct deal_name FROM deals);


-- WITH theResultSet AS
-- (
--     SELECT DISTINCT(deal_name) AS name FROM deals
-- )
-- SELECT DISTINCT burger_id
--   FROM deals AS a
--   JOIN theResultSet as b ON a.deal_name = b.name;
--
--   -- selecting on deal_name and day returns the burgers
  -- SELECT name FROM burgers WHERE id IN
  -- (SELECT a.burger_id
  -- FROM deals a
  -- WHERE (SELECT COUNT(*)
  --        FROM deals b
  --        WHERE a.deal_name = b.deal_name
  --        AND a.day=b.day)>1);

SELECT burgers.* FROM burgers INNER JOIN burgers_deals ON burgers_deals.burger_id = burgers.id WHERE burgers_deals.deal_id = 7;
