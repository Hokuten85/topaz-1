select *
from item_armor a
inner join item_armor2 b
	ON a.itemid = b.itemid
WHERE a.globalDrop != b.globalDrop

update item_armor2 a
INNER JOIN item_armor b ON a.itemid = b.itemid
SET a.globalDrop = b.globalDrop
WHERE a.MId != b.MId

ALTER TABLE item_armor2
ADD COLUMN `globalDrop` tinyint(1) DEFAULT '0'