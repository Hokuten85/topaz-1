SELECT itemid, name, 1 AS sell01, 0 AS buy01,
		GREATEST(FLOOR(IF(!ISNULL(vp.price) AND vp.price<bd.Price, vp.price, bd.Price)), 1) as price01,
        40 AS stock01,
        if(stackSize > 1, 1, 0) as sell12,
        0 AS buy12,
        GREATEST(FLOOR(IF(!ISNULL(vp.price) AND vp.price<bd.Price, vp.price, bd.Price) * stackSize * 0.9), 1) as price12,
        40 as stock12
FROM (
	SELECT *, 1000 DIV stackSize AS Price
	FROM item_basic ib
	WHERE aH IN (15, 35, 36, 49)
	AND NoSale = 0
	AND NOT flags & (0x4000 | 0x8000)
	UNION
	SELECT *, if(BaseSell = 0, 1000 DIV stackSize, BaseSell) * 1.1 AS Price
	FROM item_basic a
	WHERE itemid NOT BETWEEN 0x0200 AND 0x0206
	-- AND (itemid BETWEEN 0x01D8 AND 0x0DFF
	-- OR itemid BETWEEN 0x7000 AND 0x7FFF)
	AND NoSale = 0
	AND aH NOT IN (0, 36, 49, 61)
	AND itemid NOT IN (836, 860, 865, 867, 874, 899, 901, 908, 909, 1110, 1272, 1273, 1274, 1275, 1276, 1277, 1279, 1280, 1281, 1282, 1283, 1293, 1295, 1296, 1311, 1312, 1313, 2168, 2169, 2172, 2371, 2372, 2373, 4949,4952,4955,4958,4961,4964,4687,4688,4689,4747,4728,4729,4730,4731,4732,4853,4855,4857,4869,4870,4873,4882,4946,4994)
	AND itemid NOT BETWEEN 3444 AND 3492
    and itemid NOT BETWEEN 6147 AND 6179
    and itemid NOT BETWEEN 6457 AND 8798
    and itemid NOT BETWEEN 8930 AND 9878
	AND NOT flags & (0x4000 | 0x8000)
	AND NOT EXISTS(SELECT 1 FROM synth_recipes WHERE a.itemid IN (Result, ResultHQ1, ResultHQ2, ResultHQ3) AND Desynth != 1)
    AND NOT EXISTS(SELECT 1 FROM item_equipment ie WHERE a.itemid = ie.itemid)
    AND aH NOT IN (15, 35, 36, 49)
    AND NOT a.flags & 0x80
    UNION
    SELECT a.*, v.price * 0.9 AS Price FROM item_basic a
	INNER JOIN vendor_prices v
		ON a.itemid = v.item_id
	WHERE a.flags & 0x80
) bd
LEFT OUTER JOIN vendor_prices vp
	ON bd.itemid = vp.item_id;
