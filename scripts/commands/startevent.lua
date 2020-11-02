---------------------------------------------------------------------------------------------------
-- func: exec
-- desc: Allows you to execute a Lua string directly from chat.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "is"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!exec <Lua string>");
end;

function onTrigger(player, event, target)
    -- Ensure a command was given..
    if (event == nil or event < 1) then
        error(player, "Invalid event.");
        return;
    end
    
     -- validate target
    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end
    
    targ:startEvent(event)
    player:PrintToPlayer(string.format("Start event %i for %s.", event, targ:getName()));
end