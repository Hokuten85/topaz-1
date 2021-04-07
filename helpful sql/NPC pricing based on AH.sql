DROP TABLE item_pricing;
create table item_pricing (
	item_id int,
    price int
);

select * from single where itemid = 4509
select * from vendor_prices where item_id = 4509
select * from item_pricing where item_id = 640;
select * from item_basic where name like '%bronze%';
select * from synth_recipes WHERE Result = 12448;
select * from synth_recipes WHERE Result = 649;
select * from synth_recipes WHERE Result = 660;
select * from item_basic where itemid in (1362);
SELECT ID, Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8, Result, ResultHQ1, ResultHQ2, ResultHQ3, ResultQty, ResultHQ1Qty, ResultHQ2Qty, ResultHQ3Qty 
								FROM synth_recipes WHERE 12448 IN (Result,ResultHQ1,ResultHQ2,ResultHQ3);
                                
select * from item_basic a
INNER JOIN item_pricing b
	ON a.itemid = b.item_id;
    
-- select a.item_id, if(b.item_id IS NULL OR a.price * 1.4 < b.price, a.price * 1.4, b.price)   FROM item_pricing a

select a.item_id, FLOOR(if(b.item_id IS NULL OR a.price * 1.4 < b.price, a.price * 1.4, b.price))   FROM item_pricing a
LEFT OUTER JOIN vendor_prices b
	ON a.item_id = b.item_id
INNER JOIN item_equipment c
	ON a.item_id = c.itemid
INNER JOIN item_basic d
	ON c.itemid = d.itemid
WHERE aH NOT IN (15, 36, 49)

select * from auction_house where itemid = 572
    
select * from item_pricing WHERE item_id = 1445
select * from vendor_prices where item_id = 1445
select * from auction_house where itemid = 1445;
select * from synth_recipes where 1445 IN (Result,ResultHQ1,ResultHQ2,ResultHQ3); 

DROP TABLE single;
CREATE TABLE single
SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid;

DROP TABLE stack;
CREATE TABLE stack
SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
FROM auction_house ah
INNER JOIN item_basic ib
	ON ah.itemid = ib.itemid
WHERE seller_name = 'IVALICE' AND stack = 1
GROUP BY ib.itemid;

SELECT *
FROM synth_recipes sr
INNER JOIN item_basic nq ON sr.Result = nq.itemid
INNER JOIN item_equipment ia ON nq.itemid = ia.itemId
LEFT OUTER JOIN item_basic hq ON sr.ResultHQ1 = hq.itemid
LEFT OUTER JOIN item_basic hq2 ON sr.ResultHQ2 = hq2.itemid
LEFT OUTER JOIN item_basic hq3 ON sr.ResultHQ3 = hq3.itemid
LEFT OUTER JOIN single s1 ON s1.itemid = sr.Ingredient1
LEFT OUTER JOIN single s2 ON s2.itemid = sr.Ingredient2
LEFT OUTER JOIN single s3 ON s3.itemid = sr.Ingredient3
LEFT OUTER JOIN single s4 ON s4.itemid = sr.Ingredient4
LEFT OUTER JOIN single s5 ON s5.itemid = sr.Ingredient5
LEFT OUTER JOIN single s6 ON s6.itemid = sr.Ingredient6
LEFT OUTER JOIN single s7 ON s7.itemid = sr.Ingredient7
LEFT OUTER JOIN single s8 ON s8.itemid = sr.Ingredient8
WHERE (s1.itemid IS NOT NULL OR sr.Ingredient1 = 0)
AND (s2.itemid IS NOT NULL OR sr.Ingredient2 = 0)
AND (s3.itemid IS NOT NULL OR sr.Ingredient3 = 0)
AND (s4.itemid IS NOT NULL OR sr.Ingredient4 = 0)
AND (s5.itemid IS NOT NULL OR sr.Ingredient5 = 0)
AND (s6.itemid IS NOT NULL OR sr.Ingredient6 = 0)
AND (s7.itemid IS NOT NULL OR sr.Ingredient7 = 0)
AND (s8.itemid IS NOT NULL OR sr.Ingredient8 = 0)


-- UPDATE item_basic ib
INNER JOIN (
		select a.id
				, nq.itemid, nq.name as nqName, nq.BaseSell * a.ResultQty as nqNPC
				, hq.itemid as hqitemid, hq.name as hqName, hq.BaseSell * a.ResultHQ1Qty as hqNPC
				, hq.itemid as hq2itemid, hq2.name as hq2Name, hq2.BaseSell * a.ResultHQ2Qty as hq2NPC
				, hq.itemid as hq3itemid, hq3.name as hq3Name, hq3.BaseSell * a.ResultHQ3Qty as hq3NPC
				, coalesce(stack1.AHPrice,single1.AHPrice,0)
					+ coalesce(stack2.AHPrice,single2.AHPrice,0)
					+ coalesce(stack3.AHPrice,single3.AHPrice,0)
					+ coalesce(stack4.AHPrice,single4.AHPrice,0)
					+ coalesce(stack5.AHPrice,single5.AHPrice,0)
					+ coalesce(stack6.AHPrice,single6.AHPrice,0)
					+ coalesce(stack7.AHPrice,single7.AHPrice,0)
					+ coalesce(stack8.AHPrice,single8.AHPrice,0) AS AHTotalPrice
		from synth_recipes a
		INNER JOIN item_basic nq
			ON a.Result = nq.itemid
		INNER JOIN item_armor ia
			ON nq.itemid = ia.itemId
		LEFT OUTER JOIN item_basic hq
			ON a.ResultHQ1 = hq.itemid
		LEFT OUTER JOIN item_basic hq2
			ON a.ResultHQ2 = hq2.itemid
		LEFT OUTER JOIN item_basic hq3
			ON a.ResultHQ3 = hq3.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack1
			ON a.Ingredient1 = stack1.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single1
			ON a.Ingredient1 = single1.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack2
			ON a.Ingredient2 = stack2.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single2
			ON a.Ingredient2 = single2.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack3
			ON a.Ingredient3 = stack3.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single3
			ON a.Ingredient3 = single3.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack4
			ON a.Ingredient4 = stack4.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single4
			ON a.Ingredient4 = single4.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack5
			ON a.Ingredient5 = stack5.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single5
			ON a.Ingredient5 = single5.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack6
			ON a.Ingredient6 = stack6.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single6
			ON a.Ingredient6 = single6.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack7
			ON a.Ingredient7 = stack7.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single7
			ON a.Ingredient7 = single7.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack8
			ON a.Ingredient8 = stack8.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single8
			ON a.Ingredient8 = single8.itemid

		WHERE nq.BaseSell > 0 AND nq.NoSale = 0
		AND (hq.itemid IS NULL OR hq.BaseSell > 0 AND hq.NoSale = 0)
		AND (hq2.itemid IS NULL OR hq2.BaseSell > 0 AND hq2.NoSale = 0)
		AND (hq3.itemid IS NULL OR hq3.BaseSell > 0 AND hq3.NoSale = 0)
	) stuff
    ON ib.itemid = stuff.hq3itemid
    AND hq2itemid != hq3itemid
SET ib.BaseSell = AHTotalPrice * 1.4
WHERE AHTotalPrice > 0
AND AHTotalPrice * 1.4 < hqNPC;

SELECT *, cast(AHTotalPrice * 1.4 as SIGNED), cast(NewBreakEvenPrice * 1.4 AS SIGNED), nqNPC - AHTotalPrice, hqNPC - AHTotalPrice, hq3NPC - AHTotalPrice
FROM (
		select a.id
				, nq.itemid, nq.name as nqName, nq.BaseSell * a.ResultQty as nqNPC
				, hq.itemid as hqitemid, hq.name as hqName, hq.BaseSell * a.ResultHQ1Qty as hqNPC
				, hq.itemid as hq2itemid, hq2.name as hq2Name, hq2.BaseSell * a.ResultHQ2Qty as hq2NPC
				, hq.itemid as hq3itemid, hq3.name as hq3Name, hq3.BaseSell * a.ResultHQ3Qty as hq3NPC
				, coalesce(stack1.AHPrice,single1.AHPrice,0)
					+ coalesce(stack2.AHPrice,single2.AHPrice,0)
					+ coalesce(stack3.AHPrice,single3.AHPrice,0)
					+ coalesce(stack4.AHPrice,single4.AHPrice,0)
					+ coalesce(stack5.AHPrice,single5.AHPrice,0)
					+ coalesce(stack6.AHPrice,single6.AHPrice,0)
					+ coalesce(stack7.AHPrice,single7.AHPrice,0)
					+ coalesce(stack8.AHPrice,single8.AHPrice,0) AS AHTotalPrice
				, (coalesce(stack1.AHPrice,single1.AHPrice,0)
					+ coalesce(stack2.AHPrice,single2.AHPrice,0)
					+ coalesce(stack3.AHPrice,single3.AHPrice,0)
					+ coalesce(stack4.AHPrice,single4.AHPrice,0)
					+ coalesce(stack5.AHPrice,single5.AHPrice,0)
					+ coalesce(stack6.AHPrice,single6.AHPrice,0)
					+ coalesce(stack7.AHPrice,single7.AHPrice,0)
					+ coalesce(stack8.AHPrice,single8.AHPrice,0)) / coalesce(a.ResultHQ3Qty, a.ResultHQ2Qty, a.ResultHQ1Qty, a.ResultQty) AS NewBreakEvenPrice
		from synth_recipes a
		INNER JOIN item_basic nq
			ON a.Result = nq.itemid
		INNER JOIN item_armor ia
			ON nq.itemid = ia.itemId
		LEFT OUTER JOIN item_basic hq
			ON a.ResultHQ1 = hq.itemid
		LEFT OUTER JOIN item_basic hq2
			ON a.ResultHQ2 = hq2.itemid
		LEFT OUTER JOIN item_basic hq3
			ON a.ResultHQ3 = hq3.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack1
			ON a.Ingredient1 = stack1.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single1
			ON a.Ingredient1 = single1.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack2
			ON a.Ingredient2 = stack2.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single2
			ON a.Ingredient2 = single2.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack3
			ON a.Ingredient3 = stack3.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single3
			ON a.Ingredient3 = single3.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack4
			ON a.Ingredient4 = stack4.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single4
			ON a.Ingredient4 = single4.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack5
			ON a.Ingredient5 = stack5.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single5
			ON a.Ingredient5 = single5.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack6
			ON a.Ingredient6 = stack6.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single6
			ON a.Ingredient6 = single6.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack7
			ON a.Ingredient7 = stack7.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single7
			ON a.Ingredient7 = single7.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack8
			ON a.Ingredient8 = stack8.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single8
			ON a.Ingredient8 = single8.itemid

		WHERE nq.BaseSell > 0 AND nq.NoSale = 0
		AND (hq.itemid IS NULL OR hq.BaseSell > 0 AND hq.NoSale = 0)
		AND (hq2.itemid IS NULL OR hq2.BaseSell > 0 AND hq2.NoSale = 0)
		AND (hq3.itemid IS NULL OR hq3.BaseSell > 0 AND hq3.NoSale = 0)
	) stuff
WHERE AHTotalPrice > 0
-- AND cast(AHTotalPrice * 1.4 as SIGNED) < hq3NPC
ORDER BY hqNPC - AHTotalPrice DESC;