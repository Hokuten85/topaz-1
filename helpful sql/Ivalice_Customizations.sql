-- update zone_settings set zoneip = '97.119.224.179';

-- Augments
UPDATE augments SET multiplier = 100, value = 1 WHERE augmentId = 49;
UPDATE augments SET multiplier = -100, value = 1 WHERE augmentId = 50;
UPDATE augments SET multiplier = 100, value = 1 WHERE augmentId = 111;
UPDATE augments SET multiplier = 10, value = 1 WHERE augmentId = 1152;
UPDATE augments SET multiplier = 3, value = 1 WHERE augmentId = 1153;
UPDATE augments SET multiplier = 3, value = 1 WHERE augmentId = 1154;

-- ABILITIES
UPDATE Abilities SET CE = 100, VE = 10000 WHERE abilityId = 22; -- invincible
UPDATE Abilities SET recastTime = 90 WHERE abilityId = 32; -- warcry
UPDATE Abilities SET CE = 200 WHERE abilityId = 35; -- provoke
UPDATE Abilities SET recastTime = 120, isAOE = 1 WHERE abilityId = 38; -- chakra
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 41; -- steal
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 43; -- hide
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 45; -- mug
UPDATE Abilities SET recastTime = 30, CE = 200, VE = 800 WHERE abilityId = 46; -- shield bash
UPDATE Abilities SET recastTime = 300, CE = 100, VE = 80 WHERE abilityId = 47; -- holy circle
UPDATE Abilities SET CE = 100, VE = 1860 WHERE abilityId = 48; -- sentinel
UPDATE Abilities SET recastTime = 300 WHERE abilityId = 50; -- Arcane Circle
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 57; -- shadowbind
UPDATE Abilities SET recastTime = 300 WHERE abilityId = 61; -- call wyvern
UPDATE Abilities SET recastTime = 150 WHERE abilityId = 63; -- meditate
UPDATE Abilities SET recastTime = 90 WHERE abilityId = 67; -- high jump
UPDATE Abilities SET recastTime = 120 WHERE abilityId = 68; -- super jump
UPDATE Abilities SET CE = 100, VE = 95 WHERE abilityId = 79; -- cover
UPDATE Abilities SET recastTime = 120 WHERE abilityId = 82; -- chi blast
UPDATE Abilities SET recastTime = 180 WHERE abilityId = 84; -- accomplice
UPDATE Abilities SET recastTime = 45 WHERE abilityId = 91; -- blood pact rage
UPDATE Abilities SET CE = 100, VE = 360 WHERE abilityId = 92; -- rampart
UPDATE Abilities SET recastTime = 1200 WHERE abilityId = 135; -- overdrive
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 167; -- shikikoyo
UPDATE Abilities SET recastTime = 45 WHERE abilityId = 172; -- blood pact ward
UPDATE Abilities SET recastTime = 1200 WHERE abilityId = 181; -- trance
UPDATE Abilities SET recastTime = 1200 WHERE abilityId = 210; -- tabula rasa
UPDATE Abilities SET recastTime = 150 WHERE abilityId = 230; -- sekkanoki
UPDATE abilities SET `level` = 75 WHERE abilityId = 278; -- palisade
UPDATE Abilities SET recastTime = 45 WHERE abilityId IN (656,657,658,659,660,661,662); -- camisado, somnolence, nightmare, ultimate terror, noctoshield, dream shroud, nether blast

-- MERITS
UPDATE merits SET Value = 4 WHERE meritid = 516; -- barspell effect
UPDATE merits SET Value = 1 WHERE meritid = 768; -- shield base recast

-- NPC LIST
UPDATE npc_list SET pos_rot = 66, pos_x = 1, pos_y = -3, pos_z = -29, namevis = 0, status = 0 WHERE npcid = 17719961;
UPDATE npc_list SET pos_rot = 64, pos_x = -1, pos_y = -3, pos_z = -29, namevis = 0, status = 0 WHERE npcid = 17719962;
UPDATE npc_list SET pos_rot = 52, pos_x = -3, pos_y = -3, pos_z = -29, namevis = 0, status = 0 WHERE npcid = 17719959;
UPDATE npc_list SET pos_rot = 72, pos_x = 3, pos_y = -3, pos_z = -29, namevis = 0, status = 0 WHERE npcid = 17719960;

UPDATE npc_list SET pos_rot = 235, pos_x = -38, pos_y = -8, pos_z = -155, namevis = 0, status = 0 WHERE npcid = 17727673;
UPDATE npc_list SET pos_rot = 237, pos_x = -38, pos_y = -8, pos_z = -153, namevis = 0, status = 0 WHERE npcid = 17727674;
UPDATE npc_list SET pos_rot = 237, pos_x = -37, pos_y = -8, pos_z = -156, namevis = 0, status = 0 WHERE npcid = 17727677;
UPDATE npc_list SET pos_rot = 237, pos_x = -36, pos_y = -8, pos_z = -158, namevis = 0, status = 0 WHERE npcid = 17727678;

UPDATE npc_list SET pos_rot = 48, pos_x = 6, pos_z = -71, namevis = 0, status = 0 WHERE npcid = 17736005;
UPDATE npc_list SET pos_rot = 68, pos_x = 10, pos_z = -71, namevis = 0, status = 0 WHERE npcid = 17736007;
UPDATE npc_list SET pos_rot = 70, pos_x = 12, pos_z = -71, namevis = 0, status = 0 WHERE npcid = 17736009;
UPDATE npc_list SET pos_rot = 60, pos_x = 8, pos_z = -71, namevis = 0, status = 0 WHERE npcid = 17736012;

UPDATE npc_list SET pos_rot = 60, pos_x = 54, pos_y = -7, pos_z = -45, namevis = 0, status = 0 WHERE npcid = 17756444;
UPDATE npc_list SET pos_rot = 60, pos_x = 52, pos_y = -7, pos_z = -45, namevis = 0, status = 0 WHERE npcid = 17756445;
UPDATE npc_list SET pos_rot = 60, pos_x = 50, pos_y = -7, pos_z = -45, namevis = 0, status = 0 WHERE npcid = 17756446;
UPDATE npc_list SET pos_rot = 60, pos_x = 48, pos_y = -7, pos_z = -45, namevis = 0, status = 0 WHERE npcid = 17756447;

UPDATE npc_list SET pos_rot = 125, pos_x = 113, pos_y = 40, pos_z = 370, namevis = 0, status = 0 WHERE npcid = 17257135;
UPDATE npc_list SET pos_rot = 194, pos_x = 449, pos_y = 24, pos_z = 4, namevis = 0, status = 0 WHERE npcid = 17195740;
UPDATE npc_list nl
INNER JOIN (SELECT look FROM npc_list WHERE npcid = 17257135) nl2
	ON 1 = 1
SET nl.look = nl2.look
WHERE nl.npcid = 17195740;

-- SKILL RANKS
UPDATE skill_ranks SET thf = 5, dnc = 5 WHERE skillid = 1; -- h2h
UPDATE skill_ranks SET war = 3, rdm = 1, rng = 3 WHERE skillid = 2; -- dagger
UPDATE skill_ranks SET war = 3, rdm = 1, thf = 5 WHERE skillid = 3; -- sword
UPDATE skill_ranks SET war = 1, rng = 3 WHERE skillid = 5; -- axe
UPDATE skill_ranks SET war = 3 WHERE skillid = 8; -- polearm
UPDATE skill_ranks SET war = 3 WHERE skillid = 11; -- club
UPDATE skill_ranks SET war = 3 WHERE skillid = 12; -- staff
UPDATE skill_ranks SET rng = 1, sam = 3 WHERE skillid = 25; -- archery
UPDATE skill_ranks SET rng = 1 WHERE skillid = 26; -- marksmanship
UPDATE skill_ranks SET brd = 1 WHERE skillid = 40; -- singing
UPDATE skill_ranks SET brd = 1 WHERE skillid = 41; -- string
UPDATE skill_ranks SET brd = 1 WHERE skillid = 42; -- wind
UPDATE skill_ranks SET pld = 1 WHERE skillid = 32; -- Divine Skill for PLD
UPDATE skill_ranks SET whm = 4, rdm = 1, run = 4 WHERE skillid = 34; -- Enhancing Skill for WHM, RDM, RUN
UPDATE skill_ranks SET smn = 1 WHERE skillid = 38; -- Summoning Skill for SMN
UPDATE skill_ranks SET nin = 1 WHERE skillid = 39; -- Ninjistu Skill for NIN

-- ITEM_BASIC
-- POTIONS AND ETHERS STACK TO 12
UPDATE item_basic ib
INNER JOIN item_usable iu
	ON ib.itemid = iu.itemid
SET ib.stackSize = 12
WHERE ib.stackSize = 1
AND NOT ib.flags & (0x8000 | 0x4000 | 0x0080)
AND ib.aH IN (33)
AND (ib.itemid BETWEEN 4113 AND 4143
OR ib.itemid BETWEEN 4199 AND 4211);

-- DRINK STACK TO 99
UPDATE item_basic ib
INNER JOIN item_usable iu
	ON ib.itemid = iu.itemid
SET ib.stackSize = 99
WHERE ib.stackSize = 1
AND NOT ib.flags & (0x8000 | 0x4000 | 0x0080)
AND ib.aH IN (58);

-- ITEM_EQUIPMENT

UPDATE item_equipment SET jobs = 14785 WHERE itemid = 12430;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 12555;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 12556;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 12557;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 12558;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 12686;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 12814;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 12942;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 13735;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 13793;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 14029;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 14030;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 14137;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 14138;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 14371;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 14444;
UPDATE item_equipment SET jobs = 14785 WHERE itemid = 14445;

UPDATE item_equipment SET jobs = 10689 WHERE itemid = 14524;
UPDATE item_equipment SET jobs = 10689 WHERE itemid = 14528;
UPDATE item_equipment SET jobs = 10689 WHERE itemid = 14932;
UPDATE item_equipment SET jobs = 10689 WHERE itemid = 14938;
UPDATE item_equipment SET jobs = 10689 WHERE itemid = 15603;
UPDATE item_equipment SET jobs = 10689 WHERE itemid = 15607;
UPDATE item_equipment SET jobs = 10689 WHERE itemid = 15687;
UPDATE item_equipment SET jobs = 10689 WHERE itemid = 15693;
UPDATE item_equipment SET jobs = 10689 WHERE itemid = 16061;
UPDATE item_equipment SET jobs = 10689 WHERE itemid = 16067;

UPDATE item_equipment SET jobs = 3553 WHERE itemid = 16555;

UPDATE item_equipment SET jobs = 2111715 WHERE itemid = 18139;

UPDATE item_equipment SET jobs = 2 | 2048 | 4096 WHERE itemid IN (13184,13201,13202,13186);

update item_equipment
set MId = 16
WHERE MId IN (14,15)
AND name like '%subligar%';

UPDATE item_usable SET animation = 25 WHERE itemid = 4265;

UPDATE item_puppet
SET element = 1144206147
WHERE itemid IN (8227,8196); -- storm walker

UPDATE item_puppet
SET element = 1430401570
WHERE itemid IN (8197); -- soulsoother

UPDATE item_puppet
SET element = 1380069970
WHERE itemid IN (8198); -- spiritreaver

UPDATE item_puppet
SET element = 860108068
WHERE itemid IN (8195,8226); -- sharpshot

UPDATE item_puppet
SET element = 861164324
WHERE itemid IN (8194,8225); -- valoredge

UPDATE item_puppet
SET element = 858993459
WHERE itemid IN (8193,8224); -- harlequin

INSERT INTO item_mods (itemId, modId, value) VALUES (16827, 431, 1);
INSERT INTO item_mods (itemid, modid, value) VALUES (16580, 431, 1);
INSERT INTO item_mods (itemid, modid, value) VALUES (16556, 431, 1);
INSERT INTO item_mods (itemid, modid, value) VALUES (16609, 431, 1);
INSERT INTO item_mods (itemid, modid, value) VALUES (17646, 431, 1);

INSERT INTO synth_recipes (ID, Desynth, KeyItem, Wood, Smith, Gold, Cloth, Leather, Bone, Alchemy, Cook, Crystal, HQCrystal, Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8, Result, ResultHQ1, ResultHQ2, ResultHQ3, ResultQty, ResultHQ1Qty, ResultHQ2Qty, ResultHQ3Qty, ResultName)
SELECT (select MAX(ID)+1 from synth_recipes) AS ID, Desynth, KeyItem, Wood, Smith, '20', Cloth, Leather, Bone, '61', Cook, Crystal, HQCrystal, '752', Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8, '9040', '9040', '9040', '9040', ResultQty, ResultHQ1Qty, ResultHQ2Qty, ResultHQ3Qty, 'Stabilizer III'
FROM synth_recipes
WHERE id = (select id from synth_recipes where ResultName = 'Stabilizer II')
AND NOT EXISTS (SELECT 1 FROM synth_recipes WHERE Result = 9040);

INSERT INTO synth_recipes (ID, Desynth, KeyItem, Wood, Smith, Gold, Cloth, Leather, Bone, Alchemy, Cook, Crystal, HQCrystal, Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8, Result, ResultHQ1, ResultHQ2, ResultHQ3, ResultQty, ResultHQ1Qty, ResultHQ2Qty, ResultHQ3Qty, ResultName)
SELECT (select MAX(ID)+1 from synth_recipes) AS ID, Desynth, KeyItem, Wood, Smith, '68', Cloth, Leather, Bone, '20', Cook, Crystal, HQCrystal, '752', Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8, '9037', '9037', '9037', '9037', ResultQty, ResultHQ1Qty, ResultHQ2Qty, ResultHQ3Qty, 'Accelerator III'
FROM synth_recipes
WHERE id = (select id from synth_recipes where ResultName = 'Accelerator II')
AND NOT EXISTS (SELECT 1 FROM synth_recipes WHERE Result = 9037);

UPDATE mob_spawn_points SET pos_x = 1 WHERE mobid = 17580341; -- make aroma fly spawnable

-- mob_groups
UPDATE mob_groups SET minLevel = 35, maxLevel = 35 WHERE groupid = 26 AND zoneid = 140;

UPDATE mob_groups mg
INNER JOIN mob_pools mp
	ON mg.poolid = mp.poolid
INNER JOIN mob_family_system mfs
	ON mp.familyid = mfs.familyid
SET respawntime = 180
WHERE mp.mobType = 0x00
AND mg.respawntime > 1
AND mfs.systemid NOT IN (19)
AND mg.groupid = mg.groupid;

-- mob_droplist
-- newDrops is for situations where dropid is repeated across NMs that we have special augment drops for, so break it up into different dropids, then add the augment drops
DROP TABLE IF EXISTS `newDrops`;
CREATE TABLE newDrops (
	groupid int,
	zoneid int,
	oldDropId int,
	newDropId int AUTO_INCREMENT,
	PRIMARY KEY (newDropId)
);
SET @varMax = (SELECT MAX(dropid)+1 FROM mob_droplist);
SET @s = CONCAT('ALTER TABLE newDrops AUTO_INCREMENT =', @varMax);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

INSERT INTO newDrops (groupid, zoneid, oldDropId)
SELECT DISTINCT mg.groupid, mg.zoneid, mg.dropid
FROM mob_spawn_points msp
INNER JOIN mob_groups mg
	ON msp.groupid = mg.groupid
	AND mg.zoneid = ((msp.mobid >> 12) & 0xFFF)
INNER JOIN mob_pools mp
	ON mg.poolid = mp.poolid
INNER JOIN zone_settings zs
	ON mg.zoneid = zs.zoneid
INNER JOIN (
	SELECT dropid
    FROM mob_groups
    GROUP BY dropid
    HAVING count(1) > 1
    ) bd
    ON mg.dropid = bd.dropid
WHERE mp.mobType & 0x02
AND NOT mp.mobType & (0x10 | 0x20)
AND zs.zonetype NOT IN (4,5,6)
AND mg.dropid > 0
AND mg.minlevel DIV 10 < 10;

INSERT INTO mob_droplist
select newDropId, dropType, md.groupId, groupRate, itemId, itemRate
from mob_droplist md
INNER JOIN newDrops nd
	ON md.dropid = nd.oldDropId;
    
UPDATE mob_groups mg
INNER JOIN newDrops nd
	ON mg.groupid = nd.groupid
    AND mg.zoneid = nd.zoneid
    AND mg.dropid = nd.oldDropId
SET mg.dropid = nd.newDropId;

INSERT INTO mob_droplist
SELECT DISTINCT md.dropId, 0, 0, 1000,
	CASE itemId
		WHEN 18852 THEN 17440 -- Kraken Club
        WHEN 15351 THEN 13014 -- Leaping Boots
        WHEN 15224 THEN 12486 -- Emperor Hairpin
        WHEN 15515 THEN 13056 -- Peacock Charm
        WHEN 15551 THEN 13514 -- Archer's Ring
        WHEN 15899 THEN 13189 -- Speed Belt
        WHEN 18587 THEN 17108 -- Dryad Staff
        WHEN 15736 THEN 14080 -- Strider Boots
        WHEN 14986 THEN 13952 -- Ochiudo's Kote
        WHEN 15737 THEN 13054 -- Fuma Kyahan
    END AS itemId
    , itemRate
FROM mob_groups mg
INNER JOIN mob_droplist md
	ON mg.dropid = md.dropId
WHERE md.itemId IN (18852,15351,15224,15515,15551,15899,18587,15736,14986, 15737)
ORDER BY mg.dropId;

INSERT INTO mob_droplist
SELECT dropid, dropType, groupid, groupRate, itemId, itemRate + 50 * lvlBucket AS itemRate
FROM (
	SELECT DISTINCT mg.dropid, 0 AS dropType, 0 AS groupId, 1000 as groupRate, mg.minlevel DIV 10 AS lvlBucket,
		CASE mg.minlevel DIV 10
			WHEN 0 THEN 4064
			WHEN 1 THEN 4065
			WHEN 2 THEN 4066
			WHEN 3 THEN 4067
			WHEN 4 THEN 4068
			WHEN 5 THEN 4069
			WHEN 6 THEN 4070
			WHEN 7 THEN 4071
			WHEN 8 THEN 4072
			WHEN 9 THEN 4073
			ELSE 4064
		END AS itemId,	
		300 AS itemRate
	FROM mob_spawn_points msp
	INNER JOIN mob_groups mg
		ON msp.groupid = mg.groupid
		AND mg.zoneid = ((msp.mobid >> 12) & 0xFFF)
	INNER JOIN mob_pools mp
		ON mg.poolid = mp.poolid
	INNER JOIN zone_settings zs
		ON mg.zoneid = zs.zoneid
	WHERE mp.mobType & 0x02
	AND NOT mp.mobType & (0x10 | 0x20)
	AND zs.zonetype NOT IN (4,5,6)
	AND mg.dropid > 0
	AND mg.minlevel DIV 10 < 10
) a
ORDER BY lvlBucket;

INSERT INTO mob_droplist
SELECT DISTINCT mg.dropid, 2 AS dropType, 0 AS groupId, 1000 as groupRate,
	CASE mg.minlevel DIV 10
		WHEN 0 THEN 4064
        WHEN 1 THEN 4065
        WHEN 2 THEN 4066
        WHEN 3 THEN 4067
        WHEN 4 THEN 4068
        WHEN 5 THEN 4069
        WHEN 6 THEN 4070
        WHEN 7 THEN 4071
        WHEN 8 THEN 4072
        WHEN 9 THEN 4073
        WHEN 9 THEN 4073
        ELSE 4064
    END AS itemId,
    0 AS itemRate
FROM mob_spawn_points msp
INNER JOIN mob_groups mg
	ON msp.groupid = mg.groupid
	AND mg.zoneid = ((msp.mobid >> 12) & 0xFFF)
INNER JOIN mob_pools mp
	ON mg.poolid = mp.poolid
INNER JOIN zone_settings zs
	ON mg.zoneid = zs.zoneid
WHERE mp.mobType & 0x02
AND NOT mp.mobType & (0x10 | 0x20)
AND zs.zonetype NOT IN (4,5,6)
AND mg.dropid > 0
AND mg.minlevel DIV 10 < 10
ORDER BY mg.minlevel DIV 10;

-- chapter 1 4064
-- 2 4065
-- 3 4066
-- 4 4067
-- 5 4068
-- 6 4069
-- 7 4070
-- 8 4071
-- 9 4072
-- 10 4073

update mob_droplist
set itemRate = 50
where dropType = 0 and itemrate < 50;

-- SPELL LIST
UPDATE spell_list SET mpCost = 20, castTime = 2000, recastTime = 10000 WHERE spellid = 57; -- haste
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 100; -- enfire
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 101; -- enblizzard
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 102; -- enaero
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 103; -- enstone
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 104; -- enthunder
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 105; -- enwater
UPDATE spell_list SET mpCost = 20, recastTime = 9000 WHERE spellid = 109; -- refresh
UPDATE spell_list SET mpCost = 15, castTime = 1500 WHERE spellid = 143; -- erase
UPDATE spell_list SET mpCost = 4, base = 10 WHERE spellid IN (144,149,154,159,164,169); -- fire,blizzard, aero, stone, thunder, water
UPDATE spell_list SET mpCost = 16, base = 78 WHERE spellid IN (145,150,155,160,165,170); -- fire 2,blizzard 2, aero 2, stone 2, thunder 2, water 2
UPDATE spell_list SET mpCost = 40, base = 210 WHERE spellid IN (146,151,156,161,166,171); -- fire 3,blizzard 3, aero 3, stone 3, thunder 3, water 3
UPDATE spell_list SET mpCost = 8, base = 381 WHERE spellid IN (147,152,157,162,167,172); -- fire 4,blizzard 4, aero 4, stone 4, thunder 4, water 4
UPDATE spell_list SET mpCost = 156, base = 626 WHERE spellid IN (148,153,158,163,168,173); -- fire 5,blizzard 5, aero 5, stone 5, thunder 5, water 5
UPDATE spell_list SET mpCost = 24, base = 56 WHERE spellid IN (174,179,184,189,194,199); -- firaga, blizzaga, aeroga, stonega, thundaga, waterga
UPDATE spell_list SET mpCost = 93, base = 201 WHERE spellid IN (175,180,185,190,195,200); -- firaga 2, blizzaga 2, aeroga 2, stonega 2, thundaga 2, waterga 2
UPDATE spell_list SET mpCost = 175, base = 434 WHERE spellid IN (176,181,186,191,196,201); -- firaga 3, blizzaga 3, aeroga 3, stonega 3, thundaga 3, waterga 3
UPDATE spell_list SET mpCost = 345, base = 667 WHERE spellid IN (177,182,187,192,197,202); -- firaga 4, blizzaga 4, aeroga 4, stonega 4, thundaga 4, waterga 4
UPDATE spell_list SET mpCost = 512, base = 868 WHERE spellid IN (178,183,188,193,198,203); -- firaga 5, blizzaga 5, aeroga 5, stonega 5, thundaga 5, waterga 5
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 242; -- absorb-acc
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 266; -- absorb-str
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 267; -- absorb-dex
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 268; -- absorb-vit
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 269; -- absorb-agi
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 270; -- absorb-int
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 271; -- absorb-mnd
UPDATE spell_list SET mpCost = 10, recastTime = 50000, VE = 320 WHERE spellid = 272; -- absorb-chr
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 312; -- enfire 2
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 313; -- enblizzard 2
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 314; -- enaero 2
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 315; -- enstone 2
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 316; -- enthunder 2
UPDATE spell_list SET validTargets = 3, spell_range = 204 WHERE spellid = 317; -- enwater 2
UPDATE spell_list SET jobs = 0x000000004B0000000000000000000000000000000000, mpCost = 30, recastTime = 13500 WHERE spellid = 473; -- refresh 2
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 479; -- boost-str
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 480; -- boost-dex
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 481; -- boost-vit
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 482; -- boost-agi
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 483; -- boost-int
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 484; -- boost-mnd
UPDATE spell_list SET jobs = 0x00003200000000000000000000000000000000000000 WHERE spellid = 485; -- boost-chr
UPDATE spell_list SET mpCost = 298 WHERE spellid = 496; -- firaja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 497; -- blizzaja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 498; -- aeroja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 499; -- stoneja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 500; -- thundaja
UPDATE spell_list SET mpCost = 298 WHERE spellid = 501; -- waterja
UPDATE spell_list SET mpCost = 50, recastTime = 10000 WHERE spellid = 511; -- haste 2
UPDATE spell_list SET validTargets = 3, spell_range = 204  WHERE spellid IN (249,250,251); -- blaze, ice, shock spikes

UPDATE spell_list SET base = 1 WHERE spellid = 368; -- foe_requiem
UPDATE spell_list SET base = 2 WHERE spellid = 369; -- foe_requiem_ii
UPDATE spell_list SET base = 3 WHERE spellid = 370; -- foe_requiem_iii
UPDATE spell_list SET base = 4 WHERE spellid = 371; -- foe_requiem_iv
UPDATE spell_list SET base = 5 WHERE spellid = 372; -- foe_requiem_v
UPDATE spell_list SET base = 6 WHERE spellid = 373; -- foe_requiem_vi
UPDATE spell_list SET base = 7 WHERE spellid = 374; -- foe_requiem_vii
UPDATE spell_list SET base = 1 WHERE spellid = 376; -- horde_lullaby
UPDATE spell_list SET jobs = 0x0000000000000000005C000000000000000000000000, base = 2 WHERE spellid = 377; -- horde_lullaby_ii
UPDATE spell_list SET base = 1 WHERE spellid = 378; -- armys_paeon
UPDATE spell_list SET base = 2 WHERE spellid = 379; -- armys_paeon_ii
UPDATE spell_list SET base = 3 WHERE spellid = 380; -- armys_paeon_iii
UPDATE spell_list SET base = 4 WHERE spellid = 381; -- armys_paeon_iv
UPDATE spell_list SET base = 5 WHERE spellid = 382; -- armys_paeon_v
UPDATE spell_list SET base = 6 WHERE spellid = 383; -- armys_paeon_vi
UPDATE spell_list SET base = 1 WHERE spellid = 386; -- mages_ballad
UPDATE spell_list SET base = 2 WHERE spellid = 387; -- mages_ballad_ii
UPDATE spell_list SET base = 3 WHERE spellid = 388; -- mages_ballad_iii
UPDATE spell_list SET base = 1 WHERE spellid = 389; -- knights_minne
UPDATE spell_list SET base = 2 WHERE spellid = 390; -- knights_minne_ii
UPDATE spell_list SET base = 3 WHERE spellid = 391; -- knights_minne_iii
UPDATE spell_list SET base = 4 WHERE spellid = 392; -- knights_minne_iv
UPDATE spell_list SET base = 5 WHERE spellid = 393; -- knights_minne_v
UPDATE spell_list SET base = 1 WHERE spellid = 394; -- valor_minuet
UPDATE spell_list SET base = 2 WHERE spellid = 395; -- valor_minuet_ii
UPDATE spell_list SET base = 3 WHERE spellid = 396; -- valor_minuet_iii
UPDATE spell_list SET base = 4 WHERE spellid = 397; -- valor_minuet_iv
UPDATE spell_list SET base = 5 WHERE spellid = 398; -- valor_minuet_v
UPDATE spell_list SET base = 1 WHERE spellid = 399; -- sword_madrigal
UPDATE spell_list SET base = 2 WHERE spellid = 400; -- blade_madrigal
UPDATE spell_list SET base = 1 WHERE spellid = 401; -- hunters_prelude
UPDATE spell_list SET base = 2 WHERE spellid = 402; -- archers_prelude
UPDATE spell_list SET base = 1 WHERE spellid = 403; -- sheepfoe_mambo
UPDATE spell_list SET base = 2 WHERE spellid = 404; -- dragonfoe_mambo
UPDATE spell_list SET base = 1 WHERE spellid = 405; -- fowl_aubade
UPDATE spell_list SET base = 1 WHERE spellid = 406; -- herb_pastoral
UPDATE spell_list SET base = 1 WHERE spellid = 408; -- shining_fantasia
UPDATE spell_list SET base = 1 WHERE spellid = 409; -- scops_operetta
UPDATE spell_list SET base = 2 WHERE spellid = 410; -- puppets_operetta
UPDATE spell_list SET base = 1 WHERE spellid = 412; -- gold_capriccio
UPDATE spell_list SET base = 1 WHERE spellid = 414; -- warding_round
UPDATE spell_list SET base = 1 WHERE spellid = 415; -- goblin_gavotte
UPDATE spell_list SET base = 1 WHERE spellid = 419; -- advancing_march
UPDATE spell_list SET base = 2 WHERE spellid = 420; -- victory_march
UPDATE spell_list SET base = 1 WHERE spellid = 421; -- battlefield_elegy
UPDATE spell_list SET base = 2 WHERE spellid = 422; -- carnage_elegy
UPDATE spell_list SET base = 1 WHERE spellid = 424; -- sinewy_etude
UPDATE spell_list SET base = 1 WHERE spellid = 425; -- dextrous_etude
UPDATE spell_list SET base = 1 WHERE spellid = 426; -- vivacious_etude
UPDATE spell_list SET base = 1 WHERE spellid = 427; -- quick_etude
UPDATE spell_list SET base = 1 WHERE spellid = 428; -- learned_etude
UPDATE spell_list SET base = 1 WHERE spellid = 429; -- spirited_etude
UPDATE spell_list SET base = 1 WHERE spellid = 430; -- enchanting_etude
UPDATE spell_list SET base = 2 WHERE spellid = 431; -- herculean_etude
UPDATE spell_list SET base = 2 WHERE spellid = 432; -- uncanny_etude
UPDATE spell_list SET base = 2 WHERE spellid = 433; -- vital_etude
UPDATE spell_list SET base = 2 WHERE spellid = 434; -- swift_etude
UPDATE spell_list SET base = 2 WHERE spellid = 435; -- sage_etude
UPDATE spell_list SET base = 2 WHERE spellid = 436; -- logical_etude
UPDATE spell_list SET base = 2 WHERE spellid = 437; -- bewitching_etude
UPDATE spell_list SET base = 1 WHERE spellid = 438; -- fire_carol
UPDATE spell_list SET base = 1 WHERE spellid = 439; -- ice_carol
UPDATE spell_list SET base = 1 WHERE spellid = 440; -- wind_carol
UPDATE spell_list SET base = 1 WHERE spellid = 441; -- earth_carol
UPDATE spell_list SET base = 1 WHERE spellid = 442; -- lightning_carol
UPDATE spell_list SET base = 1 WHERE spellid = 443; -- water_carol
UPDATE spell_list SET base = 1 WHERE spellid = 444; -- light_carol
UPDATE spell_list SET base = 1 WHERE spellid = 445; -- dark_carol
UPDATE spell_list SET base = 2 WHERE spellid = 446; -- fire_carol_ii
UPDATE spell_list SET base = 2 WHERE spellid = 447; -- ice_carol_ii
UPDATE spell_list SET base = 2 WHERE spellid = 448; -- wind_carol_ii
UPDATE spell_list SET base = 2 WHERE spellid = 449; -- earth_carol_ii
UPDATE spell_list SET base = 2 WHERE spellid = 450; -- lightning_carol_ii
UPDATE spell_list SET base = 2 WHERE spellid = 451; -- water_carol_ii
UPDATE spell_list SET base = 2 WHERE spellid = 452; -- light_carol_ii
UPDATE spell_list SET base = 2 WHERE spellid = 453; -- dark_carol_ii
UPDATE spell_list SET base = 1 WHERE spellid = 454; -- fire_threnody
UPDATE spell_list SET base = 1 WHERE spellid = 455; -- ice_threnody
UPDATE spell_list SET base = 1 WHERE spellid = 456; -- wind_threnody
UPDATE spell_list SET base = 1 WHERE spellid = 457; -- earth_threnody
UPDATE spell_list SET base = 1 WHERE spellid = 458; -- lightning_threnody
UPDATE spell_list SET base = 1 WHERE spellid = 459; -- water_threnody
UPDATE spell_list SET base = 1 WHERE spellid = 460; -- light_threnody
UPDATE spell_list SET base = 1 WHERE spellid = 461; -- dark_threnody
UPDATE spell_list SET base = 1 WHERE spellid = 462; -- magic_finale
UPDATE spell_list SET base = 1 WHERE spellid = 463; -- foe_lullaby
UPDATE spell_list SET base = 1 WHERE spellid = 464; -- goddesss_hymnus
UPDATE spell_list SET base = 1 WHERE spellid = 465; -- chocobo_mazurka
UPDATE spell_list SET base = 1 WHERE spellid = 466; -- maidens_virelai
UPDATE spell_list SET base = 1 WHERE spellid = 467; -- raptor_mazurka
UPDATE spell_list SET base = 1 WHERE spellid = 468; -- foe_sirvente
UPDATE spell_list SET base = 1 WHERE spellid = 469; -- adventurers_dirge
UPDATE spell_list SET base = 1 WHERE spellid = 470; -- sentinels_scherzo
UPDATE spell_list SET base = 2 WHERE spellid = 471; -- foe_lullaby_ii
UPDATE spell_list SET base = 2 WHERE spellid = 871; -- fire_threnody_ii
UPDATE spell_list SET base = 2 WHERE spellid = 872; -- ice_threnody_ii
UPDATE spell_list SET base = 2 WHERE spellid = 873; -- wind_threnody_ii
UPDATE spell_list SET base = 2 WHERE spellid = 874; -- earth_threnody_ii
UPDATE spell_list SET base = 2 WHERE spellid = 875; -- lightning_threnody_i
UPDATE spell_list SET base = 2 WHERE spellid = 876; -- water_threnody_ii
UPDATE spell_list SET base = 2 WHERE spellid = 877; -- light_threnody_ii
UPDATE spell_list SET base = 2 WHERE spellid = 878; -- dark_threnody_ii

-- TRAITS --
-- MOD_CRIT_DMG_INCREASE
INSERT INTO `traits` VALUES ('150','crit dmg bonus','6','1','1','421','10',null,0); 
INSERT INTO `traits` VALUES ('150','crit dmg bonus','13','1','1','421','10',null,0);

-- Adjust the enmity cap
INSERT INTO `traits` VALUES ('151','enmity cap','7','25','1','2000','100',null,0);
INSERT INTO `traits` VALUES ('151','enmity cap','7','50','2','2000','500',null,0);
INSERT INTO `traits` VALUES ('151','enmity cap','7','75','3','2000','2000',null,0);
INSERT INTO `traits` VALUES ('151','enmity cap','7','99','4','2000','3000',null,0);

INSERT INTO `traits` VALUES ('151','enmity cap','13','25','1','2000','100',null,0);
INSERT INTO `traits` VALUES ('151','enmity cap','13','50','2','2000','500',null,0);
INSERT INTO `traits` VALUES ('151','enmity cap','13','75','3','2000','1000',null,0);
INSERT INTO `traits` VALUES ('151','enmity cap','13','99','4','2000','1500',null,0);

-- -DT% II
INSERT INTO `traits` VALUES ('153','damage taken II','7','10','1','2001','2',null,0);
INSERT INTO `traits` VALUES ('153','damage taken II','7','30','2','2001','4',null,0);
INSERT INTO `traits` VALUES ('153','damage taken II','7','50','3','2001','6',null,0);
INSERT INTO `traits` VALUES ('153','damage taken II','7','70','4','2001','8',null,0);
INSERT INTO `traits` VALUES ('153','damage taken II','7','75','5','2001','10',null,0);
INSERT INTO `traits` VALUES ('153','damage taken II','7','99','6','2001','12',null,0);

UPDATE traits SET value = 20 WHERE traitid = 1 AND job = 14 AND level = 30 AND modifier = 25;
UPDATE traits SET value = 20 WHERE traitid = 1 AND job = 14 AND level = 30 AND modifier = 26;
UPDATE traits SET value = 50 WHERE traitid = 1 AND job = 14 AND level = 50 AND modifier = 25;
UPDATE traits SET value = 50 WHERE traitid = 1 AND job = 14 AND level = 50 AND modifier = 26;
UPDATE traits SET value = 60 WHERE traitid = 1 AND job = 14 AND level = 78 AND modifier = 25;
UPDATE traits SET value = 60 WHERE traitid = 1 AND job = 14 AND level = 78 AND modifier = 26;

UPDATE traits SET value = 15 WHERE traitid = 14 AND job = 12 AND level = 10 AND modifier = 73;
UPDATE traits SET value = 20 WHERE traitid = 14 AND job = 12 AND level = 30 AND modifier = 73;
UPDATE traits SET value = 25 WHERE traitid = 14 AND job = 12 AND level = 50 AND modifier = 73;
UPDATE traits SET value = 30 WHERE traitid = 14 AND job = 12 AND level = 70 AND modifier = 73;
UPDATE traits SET value = 35 WHERE traitid = 14 AND job = 12 AND level = 90 AND modifier = 73;

UPDATE traits SET value = 35 WHERE traitid = 67 AND job = 2 AND level = 5 AND modifier = 289;
UPDATE traits SET value = 40 WHERE traitid = 67 AND job = 2 AND level = 25 AND modifier = 289;
UPDATE traits SET value = 45 WHERE traitid = 67 AND job = 2 AND level = 40 AND modifier = 289;
UPDATE traits SET value = 50 WHERE traitid = 67 AND job = 2 AND level = 65 AND modifier = 289;
UPDATE traits SET value = 55 WHERE traitid = 67 AND job = 2 AND level = 91 AND modifier = 289;

UPDATE traits SET level = 30 WHERE traitid = 68 AND job = 6 AND level = 60;

UPDATE traits SET value = 30 WHERE traitid = 84 AND job = 11 AND level = 20 AND modifier = 305;
UPDATE traits SET VALUE = 40 WHERE traitid = 84 AND job = 11 AND level = 35 AND modifier = 305;
UPDATE traits SET VALUE = 50 WHERE traitid = 84 AND job = 11 AND LEVEL = 50 AND modifier = 305;

UPDATE traits SET level = 25 WHERE traitid = 106 AND job = 12 AND level = 78 AND rank = 1 AND modifier = 174;
UPDATE traits SET level = 50 WHERE traitid = 106 AND job = 12 AND level = 88 AND rank = 2 AND modifier = 174;
UPDATE traits SET level = 75 WHERE traitid = 106 AND job = 12 AND level = 98 AND rank = 3 AND modifier = 174;

UPDATE traits SET level = 25 WHERE traitid = 100 and job = 13 and rank = 1;
UPDATE traits SET level = 50 WHERE traitid = 100 and job = 13 and rank = 2;
UPDATE traits SET level = 74 WHERE traitid = 100 and job = 13 and rank = 3;
UPDATE traits SET level = 50 WHERE traitid = 99 and job = 7 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 99 and job = 7 and rank = 2;
UPDATE traits SET level = 50 WHERE traitid = 106 and job = 13 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 110 and job = 13 and rank = 1;

UPDATE traits SET level = 75 WHERE traitid = 17 and job = 2 and rank = 2;
UPDATE traits SET level = 50 WHERE traitid = 101 and job = 2 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 101 and job = 2 and rank = 2;

UPDATE traits SET level = 75 WHERE traitid = 13 and job = 4 and rank = 2;

UPDATE traits SET level = 75 WHERE traitid = 12 and job = 5 and rank = 4;
UPDATE traits SET level = 75 WHERE traitid = 110 and job = 5 and rank = 1;

UPDATE traits SET level = 75 WHERE traitid = 16 and job = 6 and rank = 2;
UPDATE traits SET level = 60 WHERE traitid = 18 and job = 6 and rank = 1;
UPDATE traits SET level = 50 WHERE traitid = 98 and job = 6 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 98 and job = 6 and rank = 2;

UPDATE traits SET level = 75 WHERE traitid = 3 and job = 8 and rank = 5;
UPDATE traits SET level = 75 WHERE traitid = 98 and job = 8 and rank = 1;

UPDATE traits SET level = 10, value = 16 WHERE traitid IN (32,33,34,35,36,37,38) and job = 9 and rank = 1;
UPDATE traits SET level = 50 WHERE traitid = 103 and job = 9 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 103 and job = 9 and rank = 2;

UPDATE traits SET level = 50 WHERE traitid = 108 and job = 11 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 108 and job = 11 and rank = 2;

UPDATE traits SET level = 75 WHERE traitid = 1 and job = 14 and rank = 3;
UPDATE traits SET level = 75 WHERE traitid = 3 and job = 14 and rank = 2;
UPDATE traits SET level = 75 WHERE traitid = 127 and job = 14 and rank = 2;

UPDATE traits SET level = 75 WHERE traitid = 8 and job = 15 and rank = 5;
UPDATE traits SET level = 75 WHERE traitid = 10 and job = 15 and rank = 2;
UPDATE traits SET level = 50 WHERE traitid = 103 and job = 15 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 103 and job = 15 and rank = 2;
UPDATE traits SET level = 75 WHERE traitid = 105 and job = 15 and rank = 3;

UPDATE traits SET level = 50 WHERE traitid = 103 and job = 18 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 103 and job = 18 and rank = 2;

UPDATE traits SET level = 50 WHERE traitid = 100 and job = 19 and rank = 1;
UPDATE traits SET level = 75 WHERE traitid = 100 and job = 19 and rank = 2;
UPDATE traits SET level = 75 WHERE traitid = 108 and job = 19 and rank = 1;

UPDATE traits SET level = 75 WHERE traitid = 110 and job = 20 and rank = 1;

DELIMITER $$
-- TRIGGERS
DROP TRIGGER IF EXISTS char_insert_custom $$
CREATE TRIGGER char_insert_custom
	BEFORE INSERT ON chars
	FOR EACH ROW
BEGIN
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 48, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 49, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 50, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 51, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 52, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 53, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 54, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 55, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 56, 2000, 15);
	INSERT INTO `char_skills` 	 VALUES (NEW.charid, 57, 2000, 15);
END $$
DELIMITER ;

-- WEAPONSKILLS
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 15;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 224;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 226;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 60;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 77;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 93;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 109;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 125;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 141;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 157;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 174;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 191;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 203;
UPDATE weapon_skills SET skilllevel = 300 WHERE weaponskillid = 221;

-- STATUS_EFFECTS
UPDATE status_effects SET flags = flags + 0x0002 WHERE id = 16; -- Amnesia eraseable

-- Pet Names
INSERT INTO pet_name (id, name) VALUES (1500, 'Delita'),(1501,'Ramza');

-- AUCTION HOUSE
INSERT INTO auction_house (itemid, stack, seller, seller_name, date, price)
SELECT ib.itemid, 0, 21839, 'Hokuten', 1573966939, 1000
from item_basic ib
INNER JOIN item_equipment ie
	ON ib.itemid = ie.itemid
where ib.aH > 0
AND ie.name like '%lizard%1'
	or (ie.name like '%chain%1' and level = 24)
	or (ie.name like '%baron%' and level = 20)
	or ie.name like '%beetle%1'
	or (ie.name like '%iron%1' and level < 70)
	or ie.name like '%brass%1'
	or ie.name like '%seer%1'
	or (ie.name like '%kamp%' and level = 29)
	or ie.name like '%noct%1'
	or ie.name like '%silver%1'
	or ie.name like '%Irn.Msk.%'
	or ie.name like '%luisant%'
	or ie.name like '%steel%1'
	or ie.name like '%raven%'
	or ie.name like '%t.m%'
	or ie.name like '%sipahi%';
    
INSERT INTO auction_house (itemid, stack, seller, seller_name, date, price)
SELECT ib.itemid, 0, 21839, 'Hokuten', 1573966939, 1000
from item_basic ib
INNER JOIN item_equipment ie
	ON ib.itemid = ie.itemid
where ib.aH > 0
AND ie.name like '%akinji%'
	OR ie.name like '%mythril%1'
    OR ie.name like '%wool%1'
    OR (ie.name like '%mage%' AND level < 75)
    OR ie.name like '%soil%1'
    OR (ie.name like '%ring%1' AND level < 75);

delimiter //    
CREATE PROCEDURE myproc()
BEGIN
    DECLARE i int DEFAULT 0;
    WHILE i <= 100 DO
        INSERT INTO auction_house (itemid, stack, seller, seller_name, date, price) VALUES (2229, 0, 0, 'Ivalice', 1577836800, 1000000);
        INSERT INTO auction_house (itemid, stack, seller, seller_name, date, price) VALUES (2229, 1, 0, 'Ivalice', 1577836800, 12000000);
        SET i = i + 1;
    END WHILE;
END//
delimiter ;
CALL myproc();
DROP PROCEDURE myProc;

-- MOB_SPELL_LISTS
INSERT INTO mob_spell_lists VALUES ('TRUST_Kupipi', 310, 96, 55, 255); -- AUSPICE
INSERT INTO mob_spell_lists VALUES ('TRUST_Kupipi', 310, 108, 21, 255); -- REGEN 1
INSERT INTO mob_spell_lists VALUES ('TRUST_Kupipi', 310, 110, 44, 255); -- REGEN 2
INSERT INTO mob_spell_lists VALUES ('TRUST_Kupipi', 310, 111, 66, 255); -- REGEN 3
INSERT INTO mob_spell_lists VALUES ('TRUST_Kupipi', 310, 57, 40, 255); -- HASTE

INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 254, 8, 255); -- BLIND
INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 276, 75, 255); -- BLIND 2
INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 230, 10, 255); -- BIO 
INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 231, 36, 255); -- BIO 2
INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 232, 75, 255); -- BIO 3
-- RDM Nukes
INSERT INTO mob_spell_lists
SELECT 'TRUST_Koru-Moru', 364, sl.spellid, CAST(CONV(SUBSTR(HEX(jobs),9,2),16,10) AS INT), 255
from spell_list sl
where SUBSTR(HEX(sl.jobs),9,2) <> '00'
AND sl.family IN (42,43,44,45,46,47); -- elemental nukes

INSERT INTO mob_spell_lists
SELECT 'TRUST_Koru-Moru', 364, sl.spellid, CAST(CONV(SUBSTR(HEX(jobs),9,2),16,10) AS INT), 255
from spell_list sl
where SUBSTR(HEX(sl.jobs),9,2) <> '00'
AND sl.family IN (21,22,23,24,25,26, 28, 69); -- enspells, regen, spikes

INSERT INTO mob_spell_lists VALUES ('TRUST_Zeid_II', 419, 266, 43, 255); -- absorb-str
INSERT INTO mob_spell_lists VALUES ('TRUST_Zeid_II', 419, 267, 41, 255); -- absorb-dex
INSERT INTO mob_spell_lists VALUES ('TRUST_Zeid_II', 419, 242, 61, 255); -- absorb-acc

INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 58, 6, 255); -- paralyze
INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 80, 75, 255); -- paralyze II
INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 220, 5, 255); -- poison
INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 221, 46, 255); -- poison II
INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 843, 42, 255); -- frazzle
INSERT INTO mob_spell_lists VALUES ('TRUST_Koru-Moru', 364, 844, 92, 255); -- frazzle II

INSERT INTO mob_spell_lists
SELECT 'TRUST_Shantotto_II', 428, spell_id, min_level, max_level
FROM mob_spell_lists msl1
WHERE spell_list_name = 'TRUST_Shantotto'
AND msl1.spell_id NOT IN (144,149,154,159,164,169);

INSERT INTO mob_spell_lists
SELECT 'TRUST_Joachim', 323, sl.spellid , CAST(CONV(SUBSTR(HEX(jobs),19,2),16,10) AS INT), 255
FROM spell_list sl
WHERE sl.spellid IN (394, 395, 396, 397, 398);

-- TRUST mob_family_system
UPDATE mob_family_system mfs
INNER JOIN mob_pools mp
	ON mfs.familyid = mp.familyid
INNER JOIN  spell_list sl
	ON mp.poolid = sl.spellid+5000
SET mfs.ATT = 1, mfs.DEF = 1, mfs.ACC = 1, mfs.EVA = 1, mfs.speed = 80
WHERE sl.spellid >= 896;

-- TRUST mob_pools
UPDATE  mob_pools mp
INNER JOIN spell_list sl
	ON sl.spellid+5000 = mp.poolid
INNER JOIN mob_family_system mfs
	ON mp.familyid = mfs.familyid
SET mp.behavior = 3
WHERE sl.spellid >= 896
AND sl.spellid IN (898, 952);

UPDATE mob_pools
SET cmbDmgMult = 200, sJob = 1
WHERE poolid IN (5900,5908); -- Ayame, Tenzen pool

-- TRUST Mod Settings -- 1 - negative, 2 - ignore, 3 - positive -- Job 0 is default -- Provide specific job settings if necessary
INSERT INTO trust_mod_settings VALUES (6, 27, 2);
INSERT INTO trust_mod_settings VALUES (7, 27, 3);
INSERT INTO trust_mod_settings VALUES (13, 27, 2);

INSERT INTO trust_mod_settings VALUES (0, 27, 1);
INSERT INTO trust_mod_settings VALUES (0, 160, 1);
INSERT INTO trust_mod_settings VALUES (0, 161, 1);
INSERT INTO trust_mod_settings VALUES (0, 162, 1);
INSERT INTO trust_mod_settings VALUES (0, 163, 1);
INSERT INTO trust_mod_settings VALUES (0, 164, 1);
INSERT INTO trust_mod_settings VALUES (0, 190, 1);
INSERT INTO trust_mod_settings VALUES (0, 831, 1);
INSERT INTO trust_mod_settings VALUES (0, 387, 1);
INSERT INTO trust_mod_settings VALUES (0, 388, 1);
INSERT INTO trust_mod_settings VALUES (0, 389, 1);
INSERT INTO trust_mod_settings VALUES (0, 390, 1);

INSERT INTO trust_mod_settings VALUES (0, 4, 2);
INSERT INTO trust_mod_settings VALUES (0, 7, 2);

INSERT INTO trust_mod_settings VALUES (0, 64, 2);
INSERT INTO trust_mod_settings VALUES (0, 65, 2);

INSERT INTO trust_mod_settings VALUES (0, 127, 2);
INSERT INTO trust_mod_settings VALUES (0, 128, 2);
INSERT INTO trust_mod_settings VALUES (0, 129, 2);
INSERT INTO trust_mod_settings VALUES (0, 130, 2);
INSERT INTO trust_mod_settings VALUES (0, 131, 2);
INSERT INTO trust_mod_settings VALUES (0, 132, 2);
INSERT INTO trust_mod_settings VALUES (0, 133, 2);
INSERT INTO trust_mod_settings VALUES (0, 134, 2);
INSERT INTO trust_mod_settings VALUES (0, 135, 2);
INSERT INTO trust_mod_settings VALUES (0, 136, 2);
INSERT INTO trust_mod_settings VALUES (0, 137, 2);

INSERT INTO trust_mod_settings VALUES (0, 144, 2);
INSERT INTO trust_mod_settings VALUES (0, 145, 2);
INSERT INTO trust_mod_settings VALUES (0, 146, 2);
INSERT INTO trust_mod_settings VALUES (0, 147, 2);
INSERT INTO trust_mod_settings VALUES (0, 148, 2);
INSERT INTO trust_mod_settings VALUES (0, 149, 2);
INSERT INTO trust_mod_settings VALUES (0, 150, 2);
INSERT INTO trust_mod_settings VALUES (0, 151, 2);

INSERT INTO trust_mod_settings VALUES (0, 303, 2); -- treasure hunter

INSERT INTO trust_mod_settings VALUES (0, 340, 2);

INSERT INTO trust_mod_settings VALUES (0, 380, 2);
INSERT INTO trust_mod_settings VALUES (0, 381, 2);

INSERT INTO trust_mod_settings VALUES (0, 509, 2);
INSERT INTO trust_mod_settings VALUES (0, 510, 2);
INSERT INTO trust_mod_settings VALUES (0, 511, 2);
INSERT INTO trust_mod_settings VALUES (0, 513, 2);
INSERT INTO trust_mod_settings VALUES (0, 514, 2);
INSERT INTO trust_mod_settings VALUES (0, 515, 2);

INSERT INTO trust_mod_settings VALUES (0, 851, 2);
INSERT INTO trust_mod_settings VALUES (0, 852, 2);
INSERT INTO trust_mod_settings VALUES (0, 861, 2);
INSERT INTO trust_mod_settings VALUES (0, 862, 2);
INSERT INTO trust_mod_settings VALUES (0, 916, 2);
INSERT INTO trust_mod_settings VALUES (0, 917, 2);
INSERT INTO trust_mod_settings VALUES (0, 918, 2);
INSERT INTO trust_mod_settings VALUES (0, 919, 2);
INSERT INTO trust_mod_settings VALUES (0, 920, 2);
INSERT INTO trust_mod_settings VALUES (0, 921, 2);
INSERT INTO trust_mod_settings VALUES (0, 922, 2);
INSERT INTO trust_mod_settings VALUES (0, 923, 2);
INSERT INTO trust_mod_settings VALUES (0, 924, 2);
INSERT INTO trust_mod_settings VALUES (0, 925, 2);
INSERT INTO trust_mod_settings VALUES (0, 926, 2);
INSERT INTO trust_mod_settings VALUES (0, 927, 2);
INSERT INTO trust_mod_settings VALUES (0, 928, 2);
INSERT INTO trust_mod_settings VALUES (0, 929, 2);
INSERT INTO trust_mod_settings VALUES (0, 930, 2);
INSERT INTO trust_mod_settings VALUES (0, 931, 2);
INSERT INTO trust_mod_settings VALUES (0, 932, 2);
