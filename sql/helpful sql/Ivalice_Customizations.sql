update zone_settings set zoneip = '184.97.151.39';

-- Augments
UPDATE augments SET multiplier = 100, value = 1 WHERE augmentId = 49;
UPDATE augments SET multiplier = -100, value = 1 WHERE augmentId = 50;
UPDATE augments SET multiplier = 100, value = 1 WHERE augmentId = 111;

-- ABILITIES
UPDATE Abilities SET CE = 100, VE = 10000 WHERE abilityId = 6; -- invincible
UPDATE Abilities SET recastTime = 90 WHERE abilityId = 16; -- warcry
UPDATE Abilities SET CE = 200 WHERE abilityId = 19; -- provoke
UPDATE Abilities SET recastTime = 120, isAOE = 1 WHERE abilityId = 22; -- chakra
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 25; -- steal
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 27; -- hide
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 29; -- mug
UPDATE Abilities SET recastTime = 30, CE = 200, VE = 800 WHERE abilityId = 30; -- shield bash
UPDATE Abilities SET recastTime = 300, CE = 100, VE = 80 WHERE abilityId = 31; -- holy circle
UPDATE Abilities SET recastTime = 300 WHERE abilityId = 34; -- Arcane Circle
UPDATE Abilities SET CE = 100, VE = 1860 WHERE abilityId = 32; -- sentinel
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 41; -- shadowbind
UPDATE Abilities SET recastTime = 300 WHERE abilityId = 45; -- call wyvern
UPDATE Abilities SET recastTime = 150 WHERE abilityId = 47; -- meditate
UPDATE Abilities SET recastTime = 90 WHERE abilityId = 51; -- high jump
UPDATE Abilities SET recastTime = 120 WHERE abilityId = 52; -- super jump
UPDATE Abilities SET CE = 100, VE = 95 WHERE abilityId = 63; -- cover
UPDATE Abilities SET recastTime = 120 WHERE abilityId = 66; -- chi blast
UPDATE Abilities SET recastTime = 180 WHERE abilityId = 68; -- accomplice
UPDATE Abilities SET recastTime = 45 WHERE abilityId = 75; -- blood pact rage
UPDATE Abilities SET CE = 100, VE = 360 WHERE abilityId = 76; -- rampart
UPDATE Abilities SET recastTime = 1200 WHERE abilityId = 119; -- overdrive
UPDATE Abilities SET recastTime = 60 WHERE abilityId = 151; -- shikikoyo
UPDATE Abilities SET recastTime = 45 WHERE abilityId = 156; -- blood pact ward
UPDATE Abilities SET recastTime = 1200 WHERE abilityId = 165; -- trance
UPDATE Abilities SET recastTime = 1200 WHERE abilityId = 194; -- tabula rasa
UPDATE Abilities SET recastTime = 150 WHERE abilityId = 214; -- sekkanoki
UPDATE Abilities SET recastTime = 45 WHERE abilityId IN (640,641,642,643,644,645,646); -- camisado, somnolence, nightmare, ultimate terror, noctoshield, dream shroud, nether blast
INSERT INTO `abilities` VALUES (262,'divine_waltz_ii',19,75,27,20,190,306,0,11,2000,0,14,20.0,1,0,0,0,0,'WOTG');

-- MERITS
UPDATE merits SET Value = 4 WHERE meritid = 516; -- barspell effect
UPDATE merits SET Value = 1 WHERE meritid = 768; -- shield base recast

-- NPC LIST
UPDATE npc_list SET pos_rot = 66, pos_x = 1, pos_y = -3, pos_z = -29, namevis = 0, status = 0 WHERE npcid = 17719919;
UPDATE npc_list SET pos_rot = 64, pos_x = -1, pos_y = -3, pos_z = -29, namevis = 0, status = 0 WHERE npcid = 17719920;
UPDATE npc_list SET pos_rot = 52, pos_x = -3, pos_y = -3, pos_z = -29, namevis = 0, status = 0 WHERE npcid = 17719917;
UPDATE npc_list SET pos_rot = 72, pos_x = 3, pos_y = -3, pos_z = -29, namevis = 0, status = 0 WHERE npcid = 17719918;

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

UPDATE npc_list SET pos_rot = 125, pos_x = 113, pos_y = 40, pos_z = 370, namevis = 0, status = 0 WHERE npcid = 17257132;
UPDATE npc_list SET pos_rot = 194, pos_x = 449, pos_y = 24, pos_z = 4, namevis = 0, status = 0 WHERE npcid = 17195738;
UPDATE npc_list nl
INNER JOIN (SELECT look FROM npc_list WHERE npcid = 17257132) nl2
	ON 1 = 1
SET nl.look = nl2.look
WHERE nl.npcid = 17195738;

-- SKILL RANKS
UPDATE skill_ranks SET war = 3, rdm = 1, rng = 3 WHERE skillid = 2; -- dagger
UPDATE skill_ranks SET war = 3, rdm = 1 WHERE skillid = 3; -- sword
UPDATE skill_ranks SET rng = 3 WHERE skillid = 5; -- axe
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

INSERT INTO synth_recipes
SELECT (select MAX(ID)+1 from synth_recipes) AS ID, Desynth, KeyItem, '61', Bone, Cloth, Cook, '50', Leather, Smith, Wood, Crystal, HQCrystal, '752', Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8, '9040', '9040', '9040', '9040', ResultQty, ResultHQ1Qty, ResultHQ2Qty, ResultHQ3Qty, 'Stabilizer III'
FROM synth_recipes
WHERE id = 1242
AND NOT EXISTS (SELECT 1 FROM synth_recipes WHERE Result = 9040);

UPDATE synth_recipes SET Result = 9037, ResultHQ1 = 9037, ResultHQ2 = 9037, ResultHQ3 = 9037 WHERE ID = 4184;
UPDATE synth_recipes SET Result = 9039, ResultHQ1 = 9039, ResultHQ2 = 9039, ResultHQ3 = 9039 WHERE ID = 4375;

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
-- Set @varMax = (SELECT MAX(dropid)+1 FROM mob_droplist);
ALTER TABLE newDrops AUTO_INCREMENT = 3138 XXX; -- BREAK HERE BECAUSE NEED TO CHECK FOR NEW MAX DROP ID

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
UPDATE spell_list SET mpCost = 4 WHERE spellid = 144; -- fire
UPDATE spell_list SET mpCost = 16 WHERE spellid = 145; -- fire 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 146; -- fire 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 147; -- fire 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 148; -- fire 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 149; -- blizzard
UPDATE spell_list SET mpCost = 16 WHERE spellid = 150; -- blizzard 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 151; -- blizzard 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 152; -- blizzard 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 153; -- blizzard 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 154; -- aero
UPDATE spell_list SET mpCost = 16 WHERE spellid = 155; -- aero 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 156; -- aero 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 157; -- aero 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 158; -- aero 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 159; -- stone
UPDATE spell_list SET mpCost = 16 WHERE spellid = 160; -- stone 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 161; -- stone 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 162; -- stone 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 163; -- stone 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 164; -- thunder
UPDATE spell_list SET mpCost = 16 WHERE spellid = 165; -- thunder 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 166; -- thunder 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 167; -- thunder 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 168; -- thunder 5
UPDATE spell_list SET mpCost = 4 WHERE spellid = 169; -- water
UPDATE spell_list SET mpCost = 16 WHERE spellid = 170; -- water 2
UPDATE spell_list SET mpCost = 40 WHERE spellid = 171; -- water 3
UPDATE spell_list SET mpCost = 88 WHERE spellid = 172; -- water 4
UPDATE spell_list SET mpCost = 156 WHERE spellid = 173; -- water 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 174; -- firaga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 175; -- firaga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 176; -- firaga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 177; -- firaga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 178; -- firaga 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 179; -- blizzaga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 180; -- blizzaga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 181; -- blizzaga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 182; -- blizzaga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 183; -- blizzaga 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 184; -- aeroga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 185; -- aeroga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 186; -- aeroga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 187; -- aeroga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 188; -- aeroga 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 189; -- stonega
UPDATE spell_list SET mpCost = 93 WHERE spellid = 190; -- stonega 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 191; -- stonega 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 192; -- stonega 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 193; -- stonega 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 194; -- thundaga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 195; -- thundaga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 196; -- thundaga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 197; -- thundaga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 198; -- thundaga 5
UPDATE spell_list SET mpCost = 24 WHERE spellid = 199; -- waterga
UPDATE spell_list SET mpCost = 93 WHERE spellid = 200; -- waterga 2
UPDATE spell_list SET mpCost = 175 WHERE spellid = 201; -- waterga 3
UPDATE spell_list SET mpCost = 345 WHERE spellid = 202; -- waterga 4
UPDATE spell_list SET mpCost = 512 WHERE spellid = 203; -- waterga 5
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
INSERT INTO `traits` VALUES (84,'recycle',11,40,2,305,40,'SOA',0);
INSERT INTO `traits` VALUES (84,'recycle',11,50,3,305,50,'SOA',0);

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
