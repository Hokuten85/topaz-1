-----------------------------------
-- func: getgambits
-- desc: gets a list of custom gambit on the cursor target trust
-----------------------------------

require("scripts/globals/status")
require("scripts/globals/gambits")

cmdprops =
{
    permission = 1,
    parameters = ""
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!getcustomgambits")
end

local function getIndex (tab, val)
    for index, value in pairs(tab) do
        if value == val then
            return index
        end
    end

    return false
end

function onTrigger(player)
    local target = player:getCursorTarget()
    if not target or target:getObjType() ~= xi.objType.TRUST then
        error(player, "No valid target found. place cursor on a trust object. ")
        return
    end

    local gambits = target:getCustomGambits()
    if gambits and #gambits > 0 then
        for i, tbl in ipairs(gambits) do
            local g_target
            if tbl["target"] ~= nil then
                g_target = getIndex(ai.target, tonumber(tbl["target"]))
            end
            
            local condition
            if tbl["condition"] ~= nil then
                condition = getIndex(ai.condition, tbl["condition"])
            end
            
            local condition_arg
            if tbl["condition_arg"] ~= nil then
                if condition == "STATUS" or condition == "NOT_STATUS" then
                    condition_arg = getIndex(xi.effect, tbl["condition_arg"])
                end
                
                if not condition_arg then
                    condition_arg = tbl["condition_arg"]
                end
            end
            
            local reaction
            if tbl["reaction"] ~= nil then
                reaction = getIndex(ai.reaction, tbl["reaction"])
            end
            
            local select
            if tbl["select"] ~= nil then
                select = getIndex(ai.select, tbl["select"])
            end

            local select_arg
            if tbl["select_arg"] ~= nil then
                if reaction == "MA" then
                    if select == "SPECIFIC" then
                        select_arg = getIndex(xi.magic.spell, tbl["select_arg"])
                    else
                        select_arg = getIndex(xi.magic.spellFamily, tbl["select_arg"])
                    end
                elseif reaction == "JA" then
                    if select == "SPECIFIC" then
                        select_arg = getIndex(xi.ja, tbl["select_arg"])
                    end
                end
                
                if not select_arg then
                    select_arg = tbl["select_arg"]
                end
            end
            
            player:PrintToPlayer(string.format("Index: %s | %s | %s | %s | %s | %s | %s", tostring(i-1), g_target, condition, condition_arg, reaction, select, select_arg))
        end
    else
        player:PrintToPlayer("No custom gambits.")
    end
end
