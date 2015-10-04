---------------------------------------------------------------------------------------------------
-- func: kb/behemoth @kb
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)  
            player:setPos('-262', '-20', '21', '196', '127');
end