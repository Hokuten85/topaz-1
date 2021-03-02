SELECT sl.spellid, sl.name, CONV(RIGHT(LEFT(HEX(sl.jobs), 20), 2), 16,10) AS LEVEL -- , HEX(sl.jobs), RIGHT(LEFT(HEX(sl.jobs), 20), 2) -- , sl.*
FROM spell_list sl
WHERE CONV(RIGHT(LEFT(HEX(sl.jobs), 20), 2), 16,10) > 0
AND spellid < 896