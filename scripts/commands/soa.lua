---------------------------------------------------------------------------------------------------
-- func:  @soa
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position Western Adoulin
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
            player:setPos('-86','4','-26','7','256');
end
