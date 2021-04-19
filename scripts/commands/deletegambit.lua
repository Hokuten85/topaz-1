-----------------------------------
-- func: deletegambit
-- desc: delete a custom gambit on the cursor target trust
-----------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "i"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!deletecustomgambit <index>")
end

function onTrigger(player, index)
    local inputError = {}
    if not index then
        error(player, "Must provide index to delete.")
        return
    end

    local target = player:getCursorTarget()
    if not target or target:getObjType() ~= xi.objType.TRUST then
        error(player, "No valid target found. place cursor on a trust object. ")
        return
    end

    target:deleteCustomGambit(index)
    player:PrintToPlayer(string.format("Target name: %s | Custom Gambit deleted", target:getName()))
end
