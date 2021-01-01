---------------------------------------------------------------------------------------------------
-- func: setplayerrace <race> <player>
-- desc: Sets the race of the user or target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!setplayerrace <race> {player}");
end;

function onTrigger(player, race, target)
    -- validate model
    if (race == nil) then
        error(player, "Invalid face ID.");
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

    -- set model
    targ:setRace(race);
    player:PrintToPlayer(string.format("Set %s's face to %i.", targ:getName(), race));
end;