---------------------------------------------
-- Ecliptic Growl
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onPetAbility(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 300 + bonusTime

    local moon = VanadielMoonPhase()
    local buffvalue = 0
    if moon > 90 then
        buffvalue = 10
    elseif moon > 75 then
        buffvalue = 9
    elseif moon > 60 then
        buffvalue = 8;
    else
        buffvalue = 7;
    end
    target:delStatusEffect(tpz.effect.STR_BOOST)
    target:delStatusEffect(tpz.effect.DEX_BOOST)
    target:delStatusEffect(tpz.effect.VIT_BOOST)
    target:delStatusEffect(tpz.effect.AGI_BOOST)
    target:delStatusEffect(tpz.effect.MND_BOOST)
    target:delStatusEffect(tpz.effect.CHR_BOOST)

    target:addStatusEffect(tpz.effect.STR_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(tpz.effect.DEX_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(tpz.effect.VIT_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(tpz.effect.AGI_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(tpz.effect.INT_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(tpz.effect.MND_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(tpz.effect.CHR_BOOST, 8-buffvalue, 0, duration)
    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end
