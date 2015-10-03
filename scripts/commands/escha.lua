---------------------------------------------------------------------------------------------------
-- func: teleport to eschna-zi'tah
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location .
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone) 
            player:setPos('8', '0', '-1', '7', '288');
end