select *
from spell_list a
INNER JOIN spell_list2 b
	ON a.spellid = b.spellid
WHERE a.name != b.name
OR a.jobs != b.jobs
OR a.group != b.group
OR a.element != b.element
OR a.zonemisc != b.zonemisc
OR a.validTargets != b.validTargets	
OR a.skill != b.skill
OR a.mpCost != b.mpCost
OR a.castTime != b.castTime
OR a.recastTime != b.recastTime
OR a.message != b.message
OR a.magicBurstMessage != b.magicBurstMessage
OR a.animation != b.animation
OR a.animationTime != b.animationTime
OR a.AOE != b.AOE
OR a.base != b.base
OR a.multiplier != b.multiplier
OR a.CE != b.CE
OR a.VE != b.VE
OR a.requirements != b.requirements
OR a.spell_range != b.spell_range
OR a.content_tag != b.content_tag