---------------------------------------------------------------------------------------------------
-- func: shop
-- desc: opens the Auction House menu anywhere in the world
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player,npc)
    stock = {
         0x1055,10000
    } 
	tpz.shop.general(player, stock)
end;