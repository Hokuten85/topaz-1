---------------------------------------------------------------------------------------------------
-- func: mobwhere
-- desc: Tells the player about the mob current position.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!mobwhere {mob ID}")
end

function onTrigger(player, target)
    local targ
    if not target then
        targ = player:getCursorTarget()
        if not targ or not targ:isMob() then
            error(player, "You must either supply a mob ID or target a mob.")
            return
        end
    else
        targ = GetMobByID(target)
        if not targ then
            error(player, "Invalid mob ID.")
            return
        end
    end

    player:PrintToPlayer(string.format("%s's position: X %.4f  Y %.4f  Z %.4f", targ:getName(), targ:getXPos(), targ:getYPos(), targ:getZPos() ))
end
