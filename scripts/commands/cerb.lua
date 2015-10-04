---------------------------------------------------------------------------------------------------
-- func:  @cerb
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location (near Cerb pop).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
            player:setPos('334', '-23', '-94', '176', '61');
end




