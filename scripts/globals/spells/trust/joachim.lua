-----------------------------------
-- Trust: Joachim
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------
local spell_object = {}

local message_page_offset = 15

local meleeSongs = {
    ['normal']  = {tpz.magic.spellFamily.MARCH = 2, tpz.magic.spellFamily.VALOR_MINUET = 3, tpz.magic.spellFamily.MADRIGAL = 2, tpz.magic.spellFamily.KNIGHTS_MINNE = 3},
    ['acc']     = {tpz.magic.spellFamily.MARCH = 2, tpz.magic.spellFamily.MADRIGAL = 1, tpz.magic.spellFamily.VALOR_MINUET = 3, tpz.magic.spellFamily.KNIGHTS_MINNE = 3},
    ['highAcc'] = {tpz.magic.spellFamily.MADRIGAL = 2, tpz.magic.spellFamily.MARCH = 1, tpz.magic.spellFamily.VALOR_MINUET = 3, tpz.magic.spellFamily.KNIGHTS_MINNE = 3},
}

local mageSongs = {
    ['normal'] = {tpz.magic.spellFamily.MAGES_BALLAD = 2, tpz.magic.spellFamily.MARCH = 2},
    ['lowMP']  = {tpz.magic.spellFamily.MAGES_BALLAD = 3, tpz.magic.spellFamily.MARCH = 2},
}

local rangedSongs = {
    ['normal']  = {tpz.magic.spellFamily.VALOR_MINUET = 3, tpz.magic.spellFamily.PRELUDE = 2},
    ['acc']     = {tpz.magic.spellFamily.PRELUDE = 1, tpz.magic.spellFamily.VALOR_MINUET = 3},
    ['highAcc'] = {tpz.magic.spellFamily.PRELUDE = 2, tpz.magic.spellFamily.VALOR_MINUET = 3},
}

local tankSongs = {
    ['normal']  = {tpz.magic.spellFamily.MARCH = 2, tpz.magic.spellFamily.VALOR_MINUET = 3, tpz.magic.spellFamily.MADRIGAL = 2, tpz.magic.spellFamily.KNIGHTS_MINNE = 3},
    ['acc']     = {tpz.magic.spellFamily.MARCH = 2, tpz.magic.spellFamily.MADRIGAL = 1, tpz.magic.spellFamily.VALOR_MINUET = 3, tpz.magic.spellFamily.KNIGHTS_MINNE = 3},
    ['highAcc'] = {tpz.magic.spellFamily.MADRIGAL = 2, tpz.magic.spellFamily.MARCH = 1, tpz.magic.spellFamily.VALOR_MINUET = 3, tpz.magic.spellFamily.KNIGHTS_MINNE = 3},
    ['mp']      = {tpz.magic.spellFamily.MAGES_BALLAD = 1, tpz.magic.spellFamily.MARCH = 2, tpz.magic.spellFamily.VALOR_MINUET = 3, tpz.magic.spellFamily.MADRIGAL = 2, tpz.magic.spellFamily.KNIGHTS_MINNE = 3},
    ['lowMP']   = {tpz.magic.spellFamily.MAGES_BALLAD = 2, tpz.magic.spellFamily.MARCH = 2, tpz.magic.spellFamily.VALOR_MINUET = 3, tpz.magic.spellFamily.MADRIGAL = 2, tpz.magic.spellFamily.KNIGHTS_MINNE = 3},
}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)

    -- Records of Eminence: Alter Ego: Joachim
    if caster:getEminenceProgress(937) then
        tpz.roe.onRecordTrigger(caster, 937)
    end

    return tpz.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.SPAWN)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.POISON, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.POISONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINDNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.VIRUNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)

    -- TODO: Better logic than this
    -- mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, tpz.effect.MARCH, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.MARCH)
    -- mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, tpz.effect.MINUET, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.VALOR_MINUET)
    -- mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, tpz.effect.MADRIGAL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.MADRIGAL)

    -- mob:addFullGambit({
        -- ['predicates'] =
        -- {
            -- {
                -- ['target'] = ai.t.MELEE, ['condition'] = ai.c.NOT_STATUS_COUNT, ['argument'] = tpz.effect.MINUET, ['argument2'] = 2, ['actionTarget'] = 1
            -- }
        -- },
        -- ['actions'] =
        -- {
            -- {
                -- ['reaction'] = ai.r.MA, ['select'] = ai.s.HIGHEST, ['argument'] = tpz.magic.spellFamily.VALOR_MINUET,
            -- }
        -- }
    -- })

    -- mob:addFullGambit({
        -- ['predicates'] =
        -- {
            -- {
                -- ['target'] = ai.t.CASTER, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.BALLAD, ['actionTarget'] = 1
            -- },
            -- {
                -- ['target'] = ai.t.self, ['condition'] = ai.c.CAN_CAST_HIGHEST, ['argument'] = tpz.magic.spellFamily.MAGES_BALLAD
            -- }
        -- },
        -- ['actions'] =
        -- {
            -- {
                -- ['reaction'] = ai.r.JA, ['select'] = ai.s.SPECIFIC, ['argument'] = tpz.ja.PIANISSIMO,
            -- },
            -- {
                -- ['reaction'] = ai.r.MA, ['select'] = ai.s.HIGHEST, ['argument'] = tpz.magic.spellFamily.MAGES_BALLAD,
            -- }
        -- }
    -- })

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    -- Try and ranged attack every 60s
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0, 60)

    mob:SetAutoAttackEnabled(false)
end

spell_object.onMobDespawn = function(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DEATH)
end

spell_object.onGambitTick = function(mob)
    local party = mob:getPartyWithTrusts()
    for _, member in pairs(party) do
        if mob:checkDistance(member) < 20 then
            local job = member:getMainJob()
            
            if has_value(tpz.tank_jobs, member:getMainJob()) then
                local mp = mob:getMPP()
                if mp < 25 then
                    -- lowMP
                elseif mp < 50 then
                    -- mp
                elseif mob:getAccP() < 85 then
                    -- acc or highAcc depending on songs on
                else
                    -- normal
                end
            elseif has_value(tpz.melee_jobs, job) then
                if mob:getAccP() < 85 then
                    -- acc or highAcc depending on songs on
                else
                    -- normal
                end
            elseif has_value(tpz.caster_jobs, job) then
                local mp = mob:getMPP()
                if mp < 25 then
                    -- lowMP
                else
                    -- normal
                end
            elseif has_value(tpz.ranged_jobs, job) then
                if mob:getAccP() < 85 then
                    -- acc or highAcc depending on songs on
                else
                    -- normal
                end
            end
        end
    end
    
    --getHitRate
    --getRangedHitRate
    -- if not mob:hasStatusEffect(tpz.effect.PIANISSIMO) then
        -- return {
            -- {['action_type'] = 2, ['targId'] = mob:getShortID(), ['actionId'] = tpz.ja.PIANISSIMO},
            -- {['action_type'] = 1, ['targId'] = mob:getShortID(), ['actionId'] = tpz.magic.spell.MAGES_BALLAD}
        -- }
    -- end
end

return spell_object
