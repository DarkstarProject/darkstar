---------------------------------------------------------------------------------------------------
-- func:  @jorg
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location (near jorg pop).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
            player:setPos('-237', '-176', '122', '43', '5')
end			