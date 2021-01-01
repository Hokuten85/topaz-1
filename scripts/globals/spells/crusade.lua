-----------------------------------------
-- Spell: Crusade
-- Enmity + 30
-----------------------------------------

require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
	local power = 30;
    local duration = 300;

    local typeEffect = tpz.effect.ENMITY_BOOST;
    if target:addStatusEffect(typeEffect, power, 0, duration) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT); -- no effect
    end

    return typeEffect;
end;
