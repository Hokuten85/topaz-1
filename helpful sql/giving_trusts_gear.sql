SELECT * FROM mob_spawn_points WHERE mobid = 17613130
SELECT * FROM nm_spawn_points WHERE mobid = 17613130

SELECT * FROM mob_spawn_points WHERE mobid = 17613129
SELECT * FROM nm_spawn_points WHERE mobid = 17613129

SELECT * FROM nm_spawn_points WHERE mobid BETWEEN 17612995 AND 17613145

UPDATE nm_spawn_points
SET mobid = mobid - 1
WHERE mobid BETWEEN 17612995 AND 17613145

SELECT *
FROM item_equipment ie
INNER JOIN item_mods im
	ON ie.itemId = im.itemId
INNER JOIN item_basic ib
	ON ie.itemId = ib.itemid
WHERE ie.`level` BETWEEN 2 AND 5
AND NOT EXISTS(SELECT 1 FROM item_weapon iw WHERE ie.itemId = iw.itemId)
AND ie.jobs & (1 << 7) -- 7 = PLD
AND NOT ib.flags & (0x8000 | 0x4000)

SELECT * FROM item_weapon WHERE itemid = 12325

SELECT *
		FROM item_equipment ie
		INNER JOIN item_mods im
			ON ie.itemId = im.itemId
		INNER JOIN item_basic ib
			ON ie.itemId = ib.itemid
		WHERE ie.`level` BETWEEN 2 AND 8
		AND NOT EXISTS(SELECT 1 FROM item_weapon iw WHERE ie.itemId = iw.itemId)
		AND ie.jobs & (1 << 7) -- 7 = PLD
		AND NOT ib.flags & (0x8000 | 0x4000)
		
SELECT *
FROM item_equipment ie
INNER JOIN item_mods im
			ON ie.itemId = im.itemId
INNER JOIN item_basic ib
			ON ie.itemId = ib.itemid
WHERE ie.itemid = 12330
AND ie.`level` BETWEEN 2 AND 8
AND NOT EXISTS(SELECT 1 FROM item_weapon iw WHERE ie.itemId = iw.itemId)
AND ie.jobs & (1 << (7-1)) -- 7 = PLD

SELECT DISTINCT slot, ItemId
FROM (
	SELECT mods.slot, mods.modId, mods.MValue, MAX(ie.itemId) AS ItemId
	FROM (
		SELECT ie.slot, im.modId, MAX(im.value) AS MValue
		FROM item_equipment ie
		INNER JOIN item_mods im
			ON ie.itemId = im.itemId
		INNER JOIN item_basic ib
			ON ie.itemId = ib.itemid
		WHERE ie.`level` BETWEEN 2 AND 8
		AND ie.jobs & (1 << 7) -- 7 = PLD
		AND NOT ib.flags & (0x8000 | 0x4000)
		GROUP BY ie.slot, im.modId
	) mods
	INNER JOIN item_equipment ie
		ON mods.slot = ie.slot
	INNER JOIN item_mods im
		ON ie.itemId = im.itemId
		AND mods.modId = im.modId
		AND mods.MValue = im.value
	INNER JOIN item_basic ib
			ON ie.itemId = ib.itemid
	WHERE ie.`level` BETWEEN 2 AND 8
	AND ie.jobs & (1 << 7) -- 7 = PLD
	AND NOT ib.flags & (0x8000 | 0x4000)
	GROUP BY mods.slot, mods.modId, mods.MValue
) dItem
WHERE NOT EXISTS(SELECT 1 FROM trust_equipment te WHERE te.trustid = 910 AND (1 << te.equipslotid) & dItem.slot AND te.itemid = dItem.itemid)

SELECT DISTINCT slot, itemId
FROM (
	SELECT dps.slot, MAX(iw.itemId) AS itemId
	FROM (
		SELECT ie.slot, MAX(iw.dmg / iw.delay) AS dps
		FROM item_weapon iw
		INNER JOIN item_equipment ie
			ON iw.itemId = ie.itemId
		INNER JOIN item_basic ib
			ON iw.itemId = ib.itemid
		WHERE ie.`level` BETWEEN 2 AND 10
		AND ie.jobs & (1 << 7)
		AND NOT ib.flags & (0x8000 | 0x4000)
		AND iw.skill = 3
		GROUP BY ie.slot
	) dps
	INNER JOIN item_weapon iw
		ON dps.dps = (iw.dmg / iw.delay)
	INNER JOIN item_equipment ie
		ON iw.itemId = ie.itemId
		AND dps.slot = ie.slot
	INNER JOIN item_basic ib
		ON iw.itemId = ib.itemid
	WHERE ie.`level` BETWEEN 2 AND 10
	AND ie.jobs & (1 << 7)
	AND NOT ib.flags & (0x8000 | 0x4000)
	AND iw.skill = 3
	GROUP BY dps.slot
) dItem
WHERE NOT EXISTS(SELECT 1 FROM trust_equipment te WHERE te.trustid = 910 AND (1 << te.equipslotid) & dItem.slot AND te.itemid = dItem.itemid)

SELECT *, 1 << equipslotid
FROM trust_equipment
WHERE trustid = 910
AND itemid = 12500

SELECT *
FROM mob_pools mp
INNER JOIN spell_list sl
	ON sl.spellid+5000 = mp.poolid
INNER JOIN mob_family_system mfs
	ON mp.familyid = mfs.familyid
WHERE sl.spellid >= 896

DROP PROCEDURE GiveTrustEquipment;
DROP PROCEDURE GiveTrustEquipmentCursor;
DROP PROCEDURE GiveTrustWeaponCursor;

DELIMITER $$

CREATE PROCEDURE GiveTrustEquipment(
	pcharid INT, 
	ptrustid INT
)
BEGIN
	DECLARE vlvl INT DEFAULT 2;
	DECLARE vjob INT;
	DECLARE vcmbSkill INT;
	SELECT mp.mJob, mp.cmbSkill INTO vjob, vcmbSkill FROM mob_pools mp WHERE mp.poolid = ptrustid+5000;

	WHILE vlvl <= 99 DO
		CALL GiveTrustEquipmentCursor(vjob, vlvl, pcharid, ptrustid);
		CALL GiveTrustWeaponCursor(vjob, vlvl, pcharid, ptrustid, vcmbSkill);
		SET vlvl = vlvl + 1;
	END WHILE;
END$$

CREATE PROCEDURE GiveTrustEquipmentCursor (
	pjob INT,
	plvl INT,
	pcharid INT,
	ptrustid INT
)
BEGIN
	DECLARE vslot, vitemid INT;
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur1 CURSOR FOR
		SELECT DISTINCT slot, ItemId
		FROM (
			SELECT mods.slot, mods.modId, mods.MValue, MAX(ie.itemId) AS ItemId
			FROM (
				SELECT ie.slot, im.modId, MAX(im.value) AS MValue
				FROM item_equipment ie
				INNER JOIN item_mods im
					ON ie.itemId = im.itemId
				INNER JOIN item_basic ib
					ON ie.itemId = ib.itemid
				INNER JOIN mods m
					ON im.modid = m.modid
				WHERE ie.`level` BETWEEN 2 AND plvl
				AND ie.jobs & (1 << (pjob-1))
				AND NOT ib.flags & (0x8000 | 0x4000)
				AND m.ignore = 0
				GROUP BY ie.slot, im.modId
			) mods
			INNER JOIN item_equipment ie
				ON mods.slot = ie.slot
			INNER JOIN item_mods im
				ON ie.itemId = im.itemId
				AND mods.modId = im.modId
				AND mods.MValue = im.value
			INNER JOIN item_basic ib
					ON ie.itemId = ib.itemid
			WHERE ie.`level` BETWEEN 2 AND plvl
			AND ie.jobs & (1 << (pjob-1))
			AND NOT ib.flags & (0x8000 | 0x4000)
			GROUP BY mods.slot, mods.modId, mods.MValue
		) dItem
		WHERE NOT EXISTS(SELECT 1 FROM trust_equipment te WHERE te.charid = pcharid AND te.trustid = ptrustid AND (1 << te.equipslotid) & dItem.slot AND te.itemid = dItem.itemid);
		
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	OPEN cur1;
	
	read_loop: LOOP
		FETCH cur1 INTO vslot, vitemid;
		IF done THEN
			LEAVE read_loop;
		END IF;
	
		IF vslot & (1 << 0) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 0, vitemid, 1, null);
		ELSEIF vslot & (1 << 1) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 1, vitemid, 1, null);
		ELSEIF vslot & (1 << 2) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 2, vitemid, 1, null);
		ELSEIF vslot & (1 << 3) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 3, vitemid, 1, null);
		ELSEIF vslot & (1 << 4) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 4, vitemid, 1, null);
		ELSEIF vslot & (1 << 5) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 5, vitemid, 1, null);
		ELSEIF vslot & (1 << 6) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 6, vitemid, 1, null);
		ELSEIF vslot & (1 << 7) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 7, vitemid, 1, null);
		ELSEIF vslot & (1 << 8) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 8, vitemid, 1, null);
		ELSEIF vslot & (1 << 9) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 9, vitemid, 1, null);
		ELSEIF vslot & (1 << 10) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 10, vitemid, 1, null);
		ELSEIF vslot & (1 << 11) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 11, vitemid, 1, null);
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 12, vitemid, 1, null);
		ELSEIF vslot & (1 << 13) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 13, vitemid, 1, null);
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 14, vitemid, 1, null);
		ELSEIF vslot & (1 << 15) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 15, vitemid, 1, null);
		END IF;
	
	END LOOP read_loop;
	
	CLOSE cur1;
END$$

CREATE PROCEDURE GiveTrustWeaponCursor (
	pjob INT,
	plvl INT,
	pcharid INT,
	ptrustid INT,
	pcmbSkill INT
)
BEGIN
	DECLARE vslot, vitemid INT;
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur1 CURSOR FOR
		SELECT DISTINCT slot, itemId
		FROM (
			SELECT dps.slot, MAX(iw.itemId) AS itemId
			FROM (
				SELECT ie.slot, MAX(iw.dmg / iw.delay) AS dps
				FROM item_weapon iw
				INNER JOIN item_equipment ie
					ON iw.itemId = ie.itemId
				INNER JOIN item_basic ib
					ON iw.itemId = ib.itemid
				WHERE ie.`level` BETWEEN 2 AND plvl
				AND ie.jobs & (1 << (pjob-1))
				AND NOT ib.flags & (0x8000 | 0x4000)
				AND iw.skill = pcmbSkill
				GROUP BY ie.slot
			) dps
			INNER JOIN item_weapon iw
				ON dps.dps = (iw.dmg / iw.delay)
			INNER JOIN item_equipment ie
				ON iw.itemId = ie.itemId
				AND dps.slot = ie.slot
			INNER JOIN item_basic ib
				ON iw.itemId = ib.itemid
			WHERE ie.`level` BETWEEN 2 AND plvl
			AND ie.jobs & (1 << (pjob-1))
			AND NOT ib.flags & (0x8000 | 0x4000)
			AND iw.skill = pcmbSkill
			GROUP BY dps.slot
		) dItem
		WHERE NOT EXISTS(SELECT 1 FROM trust_equipment te WHERE te.charid = pcharid AND te.trustid = ptrustid AND (1 << te.equipslotid) & dItem.slot AND te.itemid = dItem.itemid);
		
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	OPEN cur1;
	
	read_loop: LOOP
		FETCH cur1 INTO vslot, vitemid;
		IF done THEN
			LEAVE read_loop;
		END IF;
	
		IF vslot & (1 << 0) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 0, vitemid, 1, null);
			IF vslot & (1 << 1) THEN
				INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 1, vitemid, 1, null);
			END IF;
		ELSEIF vslot & (1 << 2) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 2, vitemid, 1, null);
		ELSEIF vslot & (1 << 3) THEN
			INSERT INTO trust_equipment VALUES (pcharid, ptrustid, 3, vitemid, 1, null);
		END IF;
	
	END LOOP read_loop;
	
	CLOSE cur1;
END$$

DELIMITER ;

CALL GiveTrustEquipment(2, 898);
CALL GiveTrustEquipment(2, 910);
CALL GiveTrustEquipment(2, 911);
CALL GiveTrustEquipment(2, 952);
CALL GiveTrustEquipment(2, 1010);