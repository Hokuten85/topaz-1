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
WHERE sl.spellid IN (900,908,915,1010);


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