UPDATE augments SET multiplier = 10, value = 1 WHERE augmentId = 1152;
UPDATE augments SET multiplier = 3, value = 1 WHERE augmentId = 1153;

SELECT * 
FROM mob_family_system mfs
INNER JOIN mob_pools mp
	ON mfs.familyid = mp.familyid
INNER JOIN  spell_list sl
	ON mp.poolid = sl.spellid+5000
INNER JOIN mob_skill_lists msl
 	ON mp.skill_list_id = msl.skill_list_id
LEFT OUTER JOIN mob_skills ms
   	ON msl.mob_skill_id = ms.mob_skill_id
LEFT OUTER JOIN mob_spell_lists mspl
	ON mp.spellList = mspl.spell_list_id
WHERE sl.spellid >= 896;

SELECT *
FROM spell_list sl
INNER JOIN mob_pools mp
	ON sl.spellid+5000 = mp.poolid
LEFT OUTER JOIN mob_skill_lists msl
 	ON mp.skill_list_id = msl.skill_list_id
LEFT OUTER JOIN mob_skills ms
	ON msl.mob_skill_id = ms.mob_skill_id
LEFT OUTER JOIN mob_spell_lists mspl
	ON mp.spellList = mspl.spell_list_id
LEFT OUTER JOIN spell_list sl2
	ON mspl.spell_id = sl2.spellid
WHERE sl.spellid = 915;

SELECT * FROM mob_pools WHERE poolid = 5900

SELECT * FROM mob_skill_lists WHERE skill_list_id = 1030

SELECT * FROM trust_equipment te
INNER JOIN item_equipment ie
	ON te.itemid = ie.itemid
INNER JOIN item_weapon iw
	ON te.itemid = iw.itemid
WHERE trustid = 915
ORDER BY te.equipslotid, ie.level

DELETE FROM trust_equipment WHERE trustid = 915

SELECT * FROM trust_equipment WHERE trustid = 900

DELETE FROM mob_skill_lists WHERE skill_list_id = 1030 AND mob_skill_id = 117

INSERT INTO mob_skill_lists VALUES ('TRUST_Shikaree_Z', 1030, 112);
INSERT INTO mob_skill_lists VALUES ('TRUST_Shikaree_Z', 1030, 114);
INSERT INTO mob_skill_lists VALUES ('TRUST_Shikaree_Z', 1030, 116);
INSERT INTO mob_skill_lists VALUES ('TRUST_Shikaree_Z', 1030, 117);
INSERT INTO mob_skill_lists VALUES ('TRUST_Shikaree_Z', 1030, 118);
INSERT INTO mob_skill_lists VALUES ('TRUST_Shikaree_Z', 1030, 119);
INSERT INTO mob_skill_lists VALUES ('TRUST_Shikaree_Z', 1030, 120);
INSERT INTO mob_skill_lists VALUES ('TRUST_Shikaree_Z', 1030, 124);
INSERT INTO mob_skill_lists VALUES ('TRUST_Shikaree_Z', 1030, 125);

INSERT INTO mob_skill_lists VALUES ('TRUST_Ayame', 1015, 156);
INSERT INTO mob_skill_lists VALUES ('TRUST_Ayame', 1015, 157);

INSERT INTO mob_skill_lists VALUES ('TRUST_Zied_II', 1125, 48);
INSERT INTO mob_skill_lists VALUES ('TRUST_Zied_II', 1125, 49);
INSERT INTO mob_skill_lists VALUES ('TRUST_Zied_II', 1125, 51);
INSERT INTO mob_skill_lists VALUES ('TRUST_Zied_II', 1125, 53);
INSERT INTO mob_skill_lists VALUES ('TRUST_Zied_II', 1125, 54);
INSERT INTO mob_skill_lists VALUES ('TRUST_Zied_II', 1125, 55);
INSERT INTO mob_skill_lists VALUES ('TRUST_Zied_II', 1125, 59);
INSERT INTO mob_skill_lists VALUES ('TRUST_Zied_II', 1125, 60);

SELECT *
FROM spell_list sl
INNER JOIN mob_pools mp
	ON sl.spellid+5000 = mp.poolid
LEFT OUTER JOIN mob_skill_lists msl
 	ON mp.skill_list_id = msl.skill_list_id
LEFT OUTER JOIN mob_skills ms
	ON msl.mob_skill_id = ms.mob_skill_id
LEFT OUTER JOIN mob_spell_lists mspl
	ON mp.spellList = mspl.spell_list_id
LEFT OUTER JOIN spell_list sl2
	ON mspl.spell_id = sl2.spellid
WHERE sl.spellid = 900;

SELECT * FROM spell_list WHERE spellid IN (898,900,908,915,910,911,952,1010,1019)

SELECT * FROM mob_skills WHERE mob_skill_id = 56

SELECT * FROM mob_skill_lists msl
INNER JOIN mob_skills ms
	ON msl.mob_skill_id = ms.mob_skill_id
WHERE skill_list_name LIKE '%zeid%'

SELECT * FROM mob_skill_lists WHERE skill_list_id = 1125

SELECT * FROM weapon_skills

UPDATE mob_pools
SET cmbDmgMult = 200
WHERE poolid = 5900; -- Ayame pool

SELECT *
FROM mob_pools
WHERE poolid IN (5900,5908,5915,6010); -- Ayame, Tenzen pool

SELECT * 
FROM mob_family_system mfs
INNER JOIN mob_pools mp
	ON mfs.familyid = mp.familyid
INNER JOIN  spell_list sl
	ON mp.poolid = sl.spellid+5000
WHERE sl.spellid >= 896;



SELECT *
FROM trust_equipment te
INNER JOIN item_basic ib
	ON te.itemid = ib.itemid
INNER JOIN item_mods im
	ON ib.itemid = im.itemId
INNER JOIN item_equipment ie
	ON ib.itemid = ie.itemid
WHERE trustid IN (900,908)
AND te.itemid = 13202
-- AND im.modId = 27
AND ie.`level` <= 75

SELECT *, jobs | 64
FROM item_equipment
WHERE itemid = 13418

SELECT *
FROM item_equipment
WHERE itemid = 14807

jobs | 64 WHERE itemid = 13418


SELECT * FROM mob_spawn_points WHERE mobname = 'Seiryu'

SELECT * FROM item_basic ib WHERE ib.name = 'Cursed_Schaller'

SELECT * FROM synth_recipes sr
INNER JOIN item_basic ib
	ON sr.result = ib.itemid
WHERE ib.name = 'Cursed_Schaller'

SELECT * FROM synth_recipes WHERE result = 12974 OR ResultHQ1 = 12974 OR ResultHQ2 = 12974 OR ResultHQ3 = 12974

UPDATE synth_recipes SET cloth = 25 WHERE ID = 13013

SELECT * FROM item_basic WHERE itemid IN (662,816,829,850)
SELECT * FROM item_basic WHERE itemid = 12974

SELECT * FROM mob_family_system WHERE systemid = 19
SELECT * FROM mob_family_system WHERE ecosystemID = 19
SELECT * FROM mob_family_system WHERE superfamilyid = 19