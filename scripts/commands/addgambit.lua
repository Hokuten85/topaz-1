-----------------------------------
-- func: addcustomgambit
-- desc: adds a custom gambit on the cursor target trust
-----------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ssssss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addcustomgambit {target type} {condition} {condition arg} {react} {select} {selector arg}")
end

function split(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function tableDepthSearch(root, tbl)
    local obj = root
    for i, str in ipairs(tbl) do
        if (obj[str]) then
            obj = obj[str]
        else
            return false
        end
    end
    
    return obj
end

function onTrigger(player, target_type, condition, condition_arg, react, select, selector_arg)
    local inputError = {}
    if not target_type then
        table.insert(inputError, "{target_type}")
    else 
        target_type = split(target_type, ".")
    end
    if not condition then
        table.insert(inputError, "{condition}")
    else
        condition = split(condition)
    end
    
    
    if not condition_arg then
        table.insert(inputError, "{condition_arg}")
    else
        condition_arg = split(condition_arg, ".")
    end
    if not react then
        table.insert(inputError, "{react}")
    else
        react = split(react)
    end
    if not select then
        table.insert(inputError, "{select}")
    else
        select = split(select, ".")
    end
    if not selector_arg then
        table.insert(inputError, "{selector_arg}")
    else
        selector_arg = split(selector_arg, ".")
    end
    
    if #inputError > 0 then
        error(player, "Must specify " .. table.concat(inputError, " "))
        return
    end
    
    local targ = tonumber(target_type[1]) or tableDepthSearch(ai.target, target_type)
    if not targ then
        error(player, "No valid target type found.")
        return
    end
    
    local cond = tonumber(condition[1]) or tableDepthSearch(ai.condition, condition)
    if not cond then
        error(player, "No valid condition found.")
        return
    end
    
    local cond_arg = tonumber(condition_arg[1]) or tableDepthSearch(tpz, condition_arg)
    if not cond_arg then
        error(player, "No valid condition arg found.")
        return
    end

    local reaction = tonumber(react[1]) or tableDepthSearch(ai.reaction, react)
    if not reaction then
        error(player, "No valid react found.")
        return
    end
    
    local selection = tonumber(select[1]) or tableDepthSearch(ai.select, select)
    if not selection then
        error(player, "No valid selection found.")
        return
    end
    
    local select_arg = tonumber(selector_arg[1]) or tableDepthSearch(tpz, selector_arg)
    if not select_arg then
        error(player, "No valid selector arg found.")
        return
    end

    local target = player:getCursorTarget()
    if not target or target:isNPC() then
        error(player, "No valid target found. place cursor on a non-npc object. ")
        return
    end

    target:addCustomGambit(targ, cond, cond_arg, reaction, selection, select_arg)
    player:PrintToPlayer(string.format("Target name: %s | Custom Gambit Added", target:getName()))
end
